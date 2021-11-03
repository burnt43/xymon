Gem::Specification.new do |s|
  s.name        = 'xymon'
  s.version     = '0.0.5'
  s.summary     = 'xymon stuff'
  s.description = 'xymon stuff'
  s.authors     = ['James Carson']
  s.email       = 'jms.crsn@gmail.com'
  s.homepage    = "http://tmpurl.com"
  s.license     = 'MIT'
  s.files = [
    'lib/xymon.rb',
    'lib/xymon/client.rb',
    'lib/xymon/client/commands.rb',
    'lib/xymon/client/commands/abstract_command.rb',
    'lib/xymon/client/commands/drop.rb',
    'lib/xymon/client/commands/status.rb',
  ]
end
