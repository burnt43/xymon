#!/usr/local/ruby/ruby-2.6.1/bin/ruby

require 'logger'
require './lib/xymon.rb'

Xymon::Client.logger = Logger.new(STDOUT)

action = ARGV[0]&.to_sym

case action
when :remove_garbage
  Xymon::Client::Commands::Drop.new(hostname: 'burnt43', testname: 'bbd').process
  Xymon::Client::Commands::Drop.new(hostname: 'burnt43', testname: 'clientlog').process
  Xymon::Client::Commands::Drop.new(hostname: 'burnt43', testname: 'cpu').process
  Xymon::Client::Commands::Drop.new(hostname: 'burnt43', testname: 'disk').process
  Xymon::Client::Commands::Drop.new(hostname: 'burnt43', testname: 'files').process
  Xymon::Client::Commands::Drop.new(hostname: 'burnt43', testname: 'info').process
  Xymon::Client::Commands::Drop.new(hostname: 'burnt43', testname: 'inode').process
  Xymon::Client::Commands::Drop.new(hostname: 'burnt43', testname: 'memory').process
  Xymon::Client::Commands::Drop.new(hostname: 'burnt43', testname: 'messages').process
  Xymon::Client::Commands::Drop.new(hostname: 'burnt43', testname: 'ports').process
  Xymon::Client::Commands::Drop.new(hostname: 'burnt43', testname: 'procs').process
  Xymon::Client::Commands::Drop.new(hostname: 'burnt43', testname: 'sslcert').process
  Xymon::Client::Commands::Drop.new(hostname: 'burnt43', testname: 'trends').process
  Xymon::Client::Commands::Drop.new(hostname: 'burnt43', testname: 'xymond').process
  Xymon::Client::Commands::Drop.new(hostname: 'burnt43', testname: 'xymongen').process
  Xymon::Client::Commands::Drop.new(hostname: 'burnt43', testname: 'xymonnet').process
when :mtt3_alarm
  Xymon::Client::Commands::Status.new(:foobar, :red, 'BIG PROBLEMS', hostname: 'mtt3.monmouth.com').process
when :mtt3_clear
  Xymon::Client::Commands::Status.new(:foobar, :green, 'ALL GOOD', hostname: 'mtt3.monmouth.com').process
end
