#!/usr/bin/env ruby

require 'net/http'
require 'webrick'

## Create a web server listening on IPv6 localhost
server = WEBrick::HTTPServer.new(
  :BindAddress => '::1',
  :ServerName => 'localhost',
  :Port => 8000
)

server.mount_proc '/' do |req, res|
  res.body = 'Hello, world!'
end

trap 'INT' do
  server.shutdown
end

Thread.new do
  server.start
end


# Make a request to the server
res = Net::HTTP.get_response('::1', '/', 8000)
puts res.body


# Close the web server
server.shutdown
