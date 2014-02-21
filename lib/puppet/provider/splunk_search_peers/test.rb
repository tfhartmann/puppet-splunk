#!/usr/bin/ruby
require 'rubygems'
require 'base64'
require 'json'
require 'net/http'
require 'net/https'
require 'openssl'


#curl --get -d "output_mode=json" -k -u admin https://localhost:8089/services/search/distributed/peers

def GET(path)
  request = Net::HTTP::Get.new(path)
  authorize(request)
  connection.request(request)
end

def connection
  return @connection if defined?(@connection)
  @connection = Net::HTTP.new("localhost", 8089)
  @connection.use_ssl = true
  @connection.verify_mode = OpenSSL::SSL::VERIFY_NONE
  @connection
end

def authorize(request)
  request.basic_auth 'admin', 'changeme'
end
foo = GET('/services/search/distributed/peers?output_mode=json')

foo = JSON.load(foo.body)
puts JSON.pretty_generate(foo['entry'])
