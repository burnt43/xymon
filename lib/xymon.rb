class String
  def to_xymon_fqdn
    gsub(/\./, ',')
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
      end

      class Status < Xymon::Client::Commands::AbstractCommand
        def initialize(testname, color, text, hostname: nil)
          @testname = testname
          @color    = color
          @text     = text
          @hostname = hostname ||Xymon::Client.hostname
        end

        def process
          return unless Xymon::Client.env_exists?

          xymon_command = 
            "#{ENV['XYMON']} #{ENV['XYMSRV']} " \
            "\"status " \
            "#{@hostname.to_xymon_fqdn}.#{@testname} " \
            "#{@color} #{Xymon::Client.timestamp}\n#{@text}\""

          Xymon::Client.log(:info, "executing #{xymon_command}")
          system(xymon_command)
        end
      end # Status
    end # Commands
  end # Client
end # Xymon

# require 'logger'
# Xymon::Client.logger = Logger.new('/home/jcarson/.tmp/xymon_dev.log')
# Xymon::Client::Commands::Status.new(:foo, :green, 'OK').process
