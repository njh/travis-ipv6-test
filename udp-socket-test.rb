#!/usr/bin/env ruby
#
# Script to test sending a UDP packet to IPv6 localhost
#

require 'socket'

server = UDPSocket.new(Socket::AF_INET6)
server.bind("::", 1234)

client = UDPSocket.new(Socket::AF_INET6)
client.connect("::1", 1234)
client.send("Hello World", 0)

mesg,ipaddr = server.recvfrom(255)
p ipaddr
