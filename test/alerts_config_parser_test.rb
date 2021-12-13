require './test/initialize'

module Xymon
  module Testing
    class AlertsConfigParserTest < Xymon::Testing::Test
      def test_parse
        parser = Xymon::Config::Alerts::Parser.new(
          filename: './test/assets/alerts.cfg.0000',
          ignore_until_pattern: 'DO_NOT_DELETE_THIS_STRING_BEHELIT'
        )
        result = parser.parse
      end
    end
  end
end
