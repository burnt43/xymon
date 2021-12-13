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

        index = 0
        assert_equal('%(mg4.monmouth.com|mg5.monmouth.com|mg6.monmouth.com)', result.dig(index, 'attrs', 'HOST'))
        assert_equal('red', result.dig(index, 'attrs', 'COLOR'))
        assert_equal('*:0000:0800', result.dig(index, 'attrs', 'TIME'))
        assert_equal('SCRIPT', result.dig(index, 'recipients', 0, 'TYPE'))
        assert_equal('/usr/local/xymon/server/user_scripts/xymon_alert.sh', result.dig(index, 'recipients', 0, 'SCRIPT'))
        assert_equal('foo', result.dig(index, 'recipients', 0, 'RECIPIENT'))
        assert_equal('plain', result.dig(index, 'recipients', 0, 'FORMAT'))
        assert_equal('365d', result.dig(index, 'recipients', 0, 'REPEAT'))

        index = 1
        assert_equal('%nb-mg(0|1|2|3|4|5|6)', result.dig(index, 'attrs', 'HOST'))
        assert_equal('red', result.dig(index, 'attrs', 'COLOR'))
        assert_equal('*:0000:0800', result.dig(index, 'attrs', 'TIME'))
        assert_equal('SCRIPT', result.dig(index, 'recipients', 0, 'TYPE'))
        assert_equal('/usr/local/xymon/server/user_scripts/xymon_alert.sh', result.dig(index, 'recipients', 0, 'SCRIPT'))
        assert_equal('foo', result.dig(index, 'recipients', 0, 'RECIPIENT'))
        assert_equal('plain', result.dig(index, 'recipients', 0, 'FORMAT'))
        assert_equal('365d', result.dig(index, 'recipients', 0, 'REPEAT'))

        index = 2
        assert_equal('%cm-mg(0|1|2)', result.dig(index, 'attrs', 'HOST'))
        assert_equal('red', result.dig(index, 'attrs', 'COLOR'))
        assert_equal('*:0000:0800', result.dig(index, 'attrs', 'TIME'))
        assert_equal('SCRIPT', result.dig(index, 'recipients', 0, 'TYPE'))
        assert_equal('/usr/local/xymon/server/user_scripts/xymon_alert.sh', result.dig(index, 'recipients', 0, 'SCRIPT'))
        assert_equal('foo', result.dig(index, 'recipients', 0, 'RECIPIENT'))
        assert_equal('plain', result.dig(index, 'recipients', 0, 'FORMAT'))
        assert_equal('365d', result.dig(index, 'recipients', 0, 'REPEAT'))

        index = 3
        assert_equal('%pl-mg(0|1)', result.dig(index, 'attrs', 'HOST'))
        assert_equal('red', result.dig(index, 'attrs', 'COLOR'))
        assert_equal('*:0000:0800', result.dig(index, 'attrs', 'TIME'))
        assert_equal('SCRIPT', result.dig(index, 'recipients', 0, 'TYPE'))
        assert_equal('/usr/local/xymon/server/user_scripts/xymon_alert.sh', result.dig(index, 'recipients', 0, 'SCRIPT'))
        assert_equal('foo', result.dig(index, 'recipients', 0, 'RECIPIENT'))
        assert_equal('plain', result.dig(index, 'recipients', 0, 'FORMAT'))
        assert_equal('365d', result.dig(index, 'recipients', 0, 'REPEAT'))

        index = 4
        assert_equal('%nk-mg(0|1|2|3)', result.dig(index, 'attrs', 'HOST'))
        assert_equal('red', result.dig(index, 'attrs', 'COLOR'))
        assert_equal('*:0000:0800', result.dig(index, 'attrs', 'TIME'))
        assert_equal('SCRIPT', result.dig(index, 'recipients', 0, 'TYPE'))
        assert_equal('/usr/local/xymon/server/user_scripts/xymon_alert.sh', result.dig(index, 'recipients', 0, 'SCRIPT'))
        assert_equal('foo', result.dig(index, 'recipients', 0, 'RECIPIENT'))
        assert_equal('plain', result.dig(index, 'recipients', 0, 'FORMAT'))
        assert_equal('365d', result.dig(index, 'recipients', 0, 'REPEAT'))

        index = 5
        assert_equal('%fs(a|0|1)', result.dig(index, 'attrs', 'HOST'))
        assert_equal('red', result.dig(index, 'attrs', 'COLOR'))
        assert_equal('*:0000:0800', result.dig(index, 'attrs', 'TIME'))
        assert_equal('SCRIPT', result.dig(index, 'recipients', 0, 'TYPE'))
        assert_equal('/usr/local/xymon/server/user_scripts/xymon_alert.sh', result.dig(index, 'recipients', 0, 'SCRIPT'))
        assert_equal('foo', result.dig(index, 'recipients', 0, 'RECIPIENT'))
        assert_equal('plain', result.dig(index, 'recipients', 0, 'FORMAT'))
        assert_equal('365d', result.dig(index, 'recipients', 0, 'REPEAT'))

        index = 6
        assert_equal('pl-fsa', result.dig(index, 'attrs', 'HOST'))
        assert_equal('red', result.dig(index, 'attrs', 'COLOR'))
        assert_equal('*:0000:0800', result.dig(index, 'attrs', 'TIME'))
        assert_equal('SCRIPT', result.dig(index, 'recipients', 0, 'TYPE'))
        assert_equal('/usr/local/xymon/server/user_scripts/xymon_alert.sh', result.dig(index, 'recipients', 0, 'SCRIPT'))
        assert_equal('foo', result.dig(index, 'recipients', 0, 'RECIPIENT'))
        assert_equal('plain', result.dig(index, 'recipients', 0, 'FORMAT'))
        assert_equal('365d', result.dig(index, 'recipients', 0, 'REPEAT'))

        index = 7
        assert_equal('%(hpbx.monmouth.com|hpbx0|hpbx1|hpbx2|hpbx3.monmouth.com|hpbx4.monmouth.com|hpbx5.monmouth.com|vhpbx1.monmouth.com|vhpbx2.monmouth.com|vhpbx3.monmouth.com|vhpbx4.monmouth.com)', result.dig(index, 'attrs', 'HOST'))
        assert_equal('red', result.dig(index, 'attrs', 'COLOR'))
        assert_equal('*:0000:0800', result.dig(index, 'attrs', 'TIME'))
        assert_equal('SCRIPT', result.dig(index, 'recipients', 0, 'TYPE'))
        assert_equal('/usr/local/xymon/server/user_scripts/xymon_alert.sh', result.dig(index, 'recipients', 0, 'SCRIPT'))
        assert_equal('foo', result.dig(index, 'recipients', 0, 'RECIPIENT'))
        assert_equal('plain', result.dig(index, 'recipients', 0, 'FORMAT'))
        assert_equal('365d', result.dig(index, 'recipients', 0, 'REPEAT'))

        index = 8
        assert_equal('%(gs3|gs4|gs5).monmouth.com', result.dig(index, 'attrs', 'HOST'))
        assert_equal('red', result.dig(index, 'attrs', 'COLOR'))
        assert_equal('*:0000:0800', result.dig(index, 'attrs', 'TIME'))
        assert_equal('SCRIPT', result.dig(index, 'recipients', 0, 'TYPE'))
        assert_equal('/usr/local/xymon/server/user_scripts/xymon_alert.sh', result.dig(index, 'recipients', 0, 'SCRIPT'))
        assert_equal('foo', result.dig(index, 'recipients', 0, 'RECIPIENT'))
        assert_equal('plain', result.dig(index, 'recipients', 0, 'FORMAT'))
        assert_equal('365d', result.dig(index, 'recipients', 0, 'REPEAT'))

        index = 9
        assert_equal('%conf(0|1)', result.dig(index, 'attrs', 'HOST'))
        assert_equal('red', result.dig(index, 'attrs', 'COLOR'))
        assert_equal('*:0000:0800', result.dig(index, 'attrs', 'TIME'))
        assert_equal('SCRIPT', result.dig(index, 'recipients', 0, 'TYPE'))
        assert_equal('/usr/local/xymon/server/user_scripts/xymon_alert.sh', result.dig(index, 'recipients', 0, 'SCRIPT'))
        assert_equal('foo', result.dig(index, 'recipients', 0, 'RECIPIENT'))
        assert_equal('plain', result.dig(index, 'recipients', 0, 'FORMAT'))
        assert_equal('365d', result.dig(index, 'recipients', 0, 'REPEAT'))

        index = 10
        assert_equal('%app(0|1|2).monmouth.com', result.dig(index, 'attrs', 'HOST'))
        assert_equal('red', result.dig(index, 'attrs', 'COLOR'))
        assert_equal('*:0000:0800', result.dig(index, 'attrs', 'TIME'))
        assert_equal('SCRIPT', result.dig(index, 'recipients', 0, 'TYPE'))
        assert_equal('/usr/local/xymon/server/user_scripts/xymon_alert.sh', result.dig(index, 'recipients', 0, 'SCRIPT'))
        assert_equal('foo', result.dig(index, 'recipients', 0, 'RECIPIENT'))
        assert_equal('plain', result.dig(index, 'recipients', 0, 'FORMAT'))
        assert_equal('365d', result.dig(index, 'recipients', 0, 'REPEAT'))

        index = 11
        assert_equal('%(recorder0.monmouth.com|recorder1)', result.dig(index, 'attrs', 'HOST'))
        assert_equal('red', result.dig(index, 'attrs', 'COLOR'))
        assert_equal('*:0000:0800', result.dig(index, 'attrs', 'TIME'))
        assert_equal('SCRIPT', result.dig(index, 'recipients', 0, 'TYPE'))
        assert_equal('/usr/local/xymon/server/user_scripts/xymon_alert.sh', result.dig(index, 'recipients', 0, 'SCRIPT'))
        assert_equal('foo', result.dig(index, 'recipients', 0, 'RECIPIENT'))
        assert_equal('plain', result.dig(index, 'recipients', 0, 'FORMAT'))
        assert_equal('365d', result.dig(index, 'recipients', 0, 'REPEAT'))

        index = 12
        assert_equal('%(vidconf|vidconf0|vidconf1)', result.dig(index, 'attrs', 'HOST'))
        assert_equal('red', result.dig(index, 'attrs', 'COLOR'))
        assert_equal('*:0000:0800', result.dig(index, 'attrs', 'TIME'))
        assert_equal('SCRIPT', result.dig(index, 'recipients', 0, 'TYPE'))
        assert_equal('/usr/local/xymon/server/user_scripts/xymon_alert.sh', result.dig(index, 'recipients', 0, 'SCRIPT'))
        assert_equal('foo', result.dig(index, 'recipients', 0, 'RECIPIENT'))
        assert_equal('plain', result.dig(index, 'recipients', 0, 'FORMAT'))
        assert_equal('365d', result.dig(index, 'recipients', 0, 'REPEAT'))

        index = 13
        assert_equal('mtt3.monmouth.com', result.dig(index, 'attrs', 'HOST'))
        assert_equal('red', result.dig(index, 'attrs', 'COLOR'))
        assert_equal('*:0000:0800', result.dig(index, 'attrs', 'TIME'))
        assert_equal('SCRIPT', result.dig(index, 'recipients', 0, 'TYPE'))
        assert_equal('/usr/local/xymon/server/user_scripts/xymon_alert.sh', result.dig(index, 'recipients', 0, 'SCRIPT'))
        assert_equal('foo', result.dig(index, 'recipients', 0, 'RECIPIENT'))
        assert_equal('plain', result.dig(index, 'recipients', 0, 'FORMAT'))
        assert_equal('365d', result.dig(index, 'recipients', 0, 'REPEAT'))

        index = 14
        assert_equal('%(hosted|crm.monmouth.com)', result.dig(index, 'attrs', 'HOST'))
        assert_equal('red', result.dig(index, 'attrs', 'COLOR'))
        assert_equal('*:0000:0800', result.dig(index, 'attrs', 'TIME'))
        assert_equal('SCRIPT', result.dig(index, 'recipients', 0, 'TYPE'))
        assert_equal('/usr/local/xymon/server/user_scripts/xymon_alert.sh', result.dig(index, 'recipients', 0, 'SCRIPT'))
        assert_equal('foo', result.dig(index, 'recipients', 0, 'RECIPIENT'))
        assert_equal('plain', result.dig(index, 'recipients', 0, 'FORMAT'))
        assert_equal('365d', result.dig(index, 'recipients', 0, 'REPEAT'))

        index = 15
        assert_equal('%(hosted|crm.monmouth.com)', result.dig(index, 'attrs', 'HOST'))
        assert_equal('red', result.dig(index, 'attrs', 'COLOR'))
        assert_equal('*:0000:0800', result.dig(index, 'attrs', 'TIME'))
        assert_equal('SCRIPT', result.dig(index, 'recipients', 0, 'TYPE'))
        assert_equal('/usr/local/xymon/server/user_scripts/xymon_alert.sh', result.dig(index, 'recipients', 0, 'SCRIPT'))
        assert_equal('foo', result.dig(index, 'recipients', 0, 'RECIPIENT'))
        assert_equal('plain', result.dig(index, 'recipients', 0, 'FORMAT'))
        assert_equal('365d', result.dig(index, 'recipients', 0, 'REPEAT'))
        assert_equal('1m', result.dig(index, 'recipients', 0, 'DURATION'))

        index = 16
        assert_equal('%(tellabs|cm-dacs1|cm-dacs2|cm-dacs3)', result.dig(index, 'attrs', 'HOST'))
        assert_equal('red', result.dig(index, 'attrs', 'COLOR'))
        assert_equal('*:0000:0800', result.dig(index, 'attrs', 'TIME'))
        assert_equal('SCRIPT', result.dig(index, 'recipients', 0, 'TYPE'))
        assert_equal('/usr/local/xymon/server/user_scripts/xymon_alert.sh', result.dig(index, 'recipients', 0, 'SCRIPT'))
        assert_equal('foo', result.dig(index, 'recipients', 0, 'RECIPIENT'))
        assert_equal('plain', result.dig(index, 'recipients', 0, 'FORMAT'))
        assert_equal('365d', result.dig(index, 'recipients', 0, 'REPEAT'))

        index = 17
        assert_equal('%(alpha-c|argus-a|argus-b)-power-plant', result.dig(index, 'attrs', 'HOST'))
        assert_equal('red', result.dig(index, 'attrs', 'COLOR'))
        assert_equal('*:0000:0800', result.dig(index, 'attrs', 'TIME'))
        assert_equal('SCRIPT', result.dig(index, 'recipients', 0, 'TYPE'))
        assert_equal('/usr/local/xymon/server/user_scripts/xymon_alert.sh', result.dig(index, 'recipients', 0, 'SCRIPT'))
        assert_equal('foo', result.dig(index, 'recipients', 0, 'RECIPIENT'))
        assert_equal('plain', result.dig(index, 'recipients', 0, 'FORMAT'))
        assert_equal('365d', result.dig(index, 'recipients', 0, 'REPEAT'))

        index = 18
        assert_equal('symmetricom-bitclock-timesource', result.dig(index, 'attrs', 'HOST'))
        assert_equal('red', result.dig(index, 'attrs', 'COLOR'))
        assert_equal('*:0000:0800', result.dig(index, 'attrs', 'TIME'))
        assert_equal('SCRIPT', result.dig(index, 'recipients', 0, 'TYPE'))
        assert_equal('/usr/local/xymon/server/user_scripts/xymon_alert.sh', result.dig(index, 'recipients', 0, 'SCRIPT'))
        assert_equal('foo', result.dig(index, 'recipients', 0, 'RECIPIENT'))
        assert_equal('plain', result.dig(index, 'recipients', 0, 'FORMAT'))
        assert_equal('365d', result.dig(index, 'recipients', 0, 'REPEAT'))

        index = 19
        assert_equal('pbx', result.dig(index, 'attrs', 'HOST'))
        assert_equal('red', result.dig(index, 'attrs', 'COLOR'))
        assert_equal('*:0000:0800', result.dig(index, 'attrs', 'TIME'))
        assert_equal('SCRIPT', result.dig(index, 'recipients', 0, 'TYPE'))
        assert_equal('/usr/local/xymon/server/user_scripts/xymon_alert.sh', result.dig(index, 'recipients', 0, 'SCRIPT'))
        assert_equal('foo', result.dig(index, 'recipients', 0, 'RECIPIENT'))
        assert_equal('plain', result.dig(index, 'recipients', 0, 'FORMAT'))
        assert_equal('365d', result.dig(index, 'recipients', 0, 'REPEAT'))

        index = 20
        assert_equal('fraud-alert', result.dig(index, 'attrs', 'HOST'))
        assert_equal('red', result.dig(index, 'attrs', 'COLOR'))
        assert_equal('*:0000:0800', result.dig(index, 'attrs', 'TIME'))
        assert_equal('SCRIPT', result.dig(index, 'recipients', 0, 'TYPE'))
        assert_equal('/usr/local/xymon/server/user_scripts/xymon_alert.sh', result.dig(index, 'recipients', 0, 'SCRIPT'))
        assert_equal('foo', result.dig(index, 'recipients', 0, 'RECIPIENT'))
        assert_equal('plain', result.dig(index, 'recipients', 0, 'FORMAT'))
        assert_equal('365d', result.dig(index, 'recipients', 0, 'REPEAT'))

        index = 21
        assert_equal('%(rdbk-7120-1|rdbk-7120-2|nbwk-7120-1|nwrk-7120-1)', result.dig(index, 'attrs', 'HOST'))
        assert_equal('red', result.dig(index, 'attrs', 'COLOR'))
        assert_equal('*:0000:0800', result.dig(index, 'attrs', 'TIME'))
        assert_equal('SCRIPT', result.dig(index, 'recipients', 0, 'TYPE'))
        assert_equal('/usr/local/xymon/server/user_scripts/xymon_alert.sh', result.dig(index, 'recipients', 0, 'SCRIPT'))
        assert_equal('foo', result.dig(index, 'recipients', 0, 'RECIPIENT'))
        assert_equal('plain', result.dig(index, 'recipients', 0, 'FORMAT'))
        assert_equal('365d', result.dig(index, 'recipients', 0, 'REPEAT'))

        index = 22
        assert_equal('%(rdbk-ONS|nwrk-ONS)', result.dig(index, 'attrs', 'HOST'))
        assert_equal('red', result.dig(index, 'attrs', 'COLOR'))
        assert_equal('*:0000:0800', result.dig(index, 'attrs', 'TIME'))
        assert_equal('SCRIPT', result.dig(index, 'recipients', 0, 'TYPE'))
        assert_equal('/usr/local/xymon/server/user_scripts/xymon_alert.sh', result.dig(index, 'recipients', 0, 'SCRIPT'))
        assert_equal('foo', result.dig(index, 'recipients', 0, 'RECIPIENT'))
        assert_equal('plain', result.dig(index, 'recipients', 0, 'FORMAT'))
        assert_equal('365d', result.dig(index, 'recipients', 0, 'REPEAT'))
      end
    end
  end
end
