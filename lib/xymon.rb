class String
  def to_xymon_fqdn
    gsub(/\./, ',')
  end

  def escape_single_quotes
    self.gsub(/'/, %Q('"'"'))
  end
end

module Xymon
  module Client
    class << self
      attr_accessor :logger

      def hostname
        @hostname ||= `hostname`.strip
      end

      def timestamp
        Time.now.strftime("%a %b %d %Y %H:%M:%S")
      end

      def env_exists?
        !ENV['XYMON'].nil? &&
        !ENV['XYMSRV'].nil?
      end

      def log(level, msg)
        return unless logger

        logger.send(level, msg)
      end
    end

    module Commands
      class AbstractCommand
        def process
          return unless Xymon::Client.env_exists?

          command_string = full_xymon_command_string
          Xymon::Client.log(:info, "executing #{command_string}")
          system(command_string)
        end

        def full_xymon_command_string
          "#{ENV['XYMON']} #{ENV['XYMSRV']} #{partial_xymon_command_string}"
        end

        def partial_xymon_command_string
          raise 'Implement in Class!'
        end
      end

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
      end # Status
    end # Commands
  end # Client
end # Xymon

# require 'logger'
# Xymon::Client.logger = Logger.new(STDOUT)
# Xymon::Client::Commands::Status.new(:foo, :green, %Q(SELECT * FROM `users` WHERE `users`.`string` = 'thing')).process
