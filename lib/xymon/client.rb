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
  end
end
