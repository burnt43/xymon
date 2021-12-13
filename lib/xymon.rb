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

lib_pathname = Pathname.new(__FILE__).parent

# xymon/client
require lib_pathname.join('xymon', 'client').to_s

# xymon/client/commands
require lib_pathname.join('xymon', 'client', 'commands').to_s
require lib_pathname.join('xymon', 'client', 'commands', 'abstract_command').to_s
require lib_pathname.join('xymon', 'client', 'commands', 'drop').to_s
require lib_pathname.join('xymon', 'client', 'commands', 'status').to_s

# xymon/config
require lib_pathname.join('xymon', 'config').to_s
require lib_pathname.join('xymon', 'config', 'alerts').to_s
require lib_pathname.join('xymon', 'config', 'alerts', 'parser').to_s
