module Xymon
  module Client
    module Commands
      class Status < Xymon::Client::Commands::AbstractCommand
        def initialize(testname, color, text, hostname: nil)
          @testname = testname
          @color    = color
          @text     = text
          @hostname = hostname || Xymon::Client.hostname
        end

        def partial_xymon_command_string
          "'status " \
          "#{@hostname.to_xymon_fqdn}.#{@testname} " \
          "#{@color} #{Xymon::Client.timestamp}\n#{@text.escape_single_quotes}'"
        end
      end
    end
  end
end
