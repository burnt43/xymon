module Xymon
  module Client
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
    end
  end
end
