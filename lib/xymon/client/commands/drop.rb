module Xymon
  module Client
    module Commands
      class Drop < Xymon::Client::Commands::AbstractCommand
        def initialize(hostname: nil, testname: nil)
          @testname = testname
          @hostname = hostname || Xymon::Client.hostname
        end

        def partial_xymon_command_string
          if @testname
            "'drop #{@hostname.to_xymon_fqdn} #{@testname}'"
          else
            "'drop #{@hostname.to_xymon_fqdn}'"
          end
        end
      end
    end
  end
end
