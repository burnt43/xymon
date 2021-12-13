module Xymon
  module Config
    module Alerts
      class Parser
        def initialize(filename: nil, raw_text: nil, ignore_until_pattern: nil)
          @filename = filename
          @raw_text = raw_text
          @ignore_until_pattern = ignore_until_pattern
        end

        def parse
          macro_regex          = %r/\$[0-9A-Z_]+/
          attribute_regex      = %r/\b([A-Z_]+)(=|<|>)([^\s]+)/
          non_whitespace_regex = %r/[^\s]/

          state = @ignore_until_pattern ? :ignore_until_pattern_found : :looking_for_rules
          macros = {}
          rules = []

          current_rule = {}

          # Lookup the replacement for a given macro.
          lookup_macro = ->(macro_name) {
            macros[macro_name]
          }

          # Replace all $MACROs in the given line.
          expand_macros = ->(input) {
            input.gsub(macro_regex) do |match|
              lookup_macro.call(match) || match
            end
          }

          # Convert a line of attributes into a hash.
          attribute_list_as_hash = ->(input) {
            scan_result = expand_macros.call(input).scan(attribute_regex)
            Hash[ scan_result.map {|s| [s[0], s[2]]} ]
          }

          # Handler for when we find a macro while parsing the file.
          macro_handler = ->(line) {
            split_result = line.split('=')
            name         = split_result[0]
            value        = split_result[1..-1].join('=')

            macros[name] = expand_macros.call(value)
          }

          # Handler for when we find the header line of a rule.
          rule_header_handler = ->(line) {
            unless current_rule.empty?
              rules.push(current_rule)
              current_rule = {}
            end

            current_rule['attrs'] = attribute_list_as_hash.call(line)
          }

          # Handler for recipient rules.
          rule_recipient_handler = ->(line) {
            split_result = expand_macros.call(line.lstrip).split

            recipient_attrs = {}

            case split_result[0]
            when 'SCRIPT'
              recipient_attrs['TYPE']      = split_result[0]
              recipient_attrs['SCRIPT']    = split_result[1]
              recipient_attrs['RECIPIENT'] = split_result[2]
            end
              
            current_rule['recipients'] ||= []
            current_rule['recipients'].push(
              recipient_attrs.merge(attribute_list_as_hash.call(line))
            )
          }

          raw_text.lines.each do |l|
            line = l.chomp
            next if line.empty?

            case state
            when :ignore_until_pattern_found
              if line.include?(@ignore_until_pattern)
                state = :looking_for_rules
              end
            when :looking_for_rules
              if line.start_with?('#')
                # NoOp: These are comments
              elsif line.start_with?('$')
                macro_handler.call(line)
              elsif line.start_with?(non_whitespace_regex)
                rule_header_handler.call(line)
              else
                rule_recipient_handler.call(line)
              end
            end
          end

          # Add whatever we have left over.
          rules.push(current_rule)

          return rules
        end

        private

        def raw_text
          @raw_text ||=
            if @filename && File.exist?(@filename)
              IO.read(@filename)
            else
              ''
            end
        end
      end
    end
  end
end
