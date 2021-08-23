require 'pathname'

class String
  def to_xymon_fqdn
    gsub(/\./, ',')
  end

  def escape_single_quotes
    self.gsub(/'/, %Q('"'"'))
  end
end

module Xymon
end

pathname = Pathname.new(__FILE__)

# xymon/client
require pathname.parent.join('xymon', 'client').to_s

# xymon/commands
require pathname.parent.join('xymon', 'client', 'commands').to_s
require pathname.parent.join('xymon', 'client', 'commands', 'abstract_command').to_s
require pathname.parent.join('xymon', 'client', 'commands', 'drop').to_s
require pathname.parent.join('xymon', 'client', 'commands', 'status').to_s

# require 'logger'
# Xymon::Client.logger = Logger.new(STDOUT)
# Xymon::Client::Commands::Status.new(:foo, :green, %Q(SELECT * FROM `users` WHERE `users`.`string` = 'thing')).process
