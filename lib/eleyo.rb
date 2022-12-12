require 'rubygems'
require 'httpi'
require 'json'

require "eleyo/api"

require "eleyo/api/bank_info"
require "eleyo/api/config"
require "eleyo/api/auth"
require "eleyo/api/nav"
require "eleyo/api/account"
require "eleyo/api/student"
require "eleyo/api/cart"

module Eleyo
  VERSION = "1.2.0"
  USER_AGENT = "Eleyo GEM #{VERSION}"
end

if ENV['ELEYO_GEM_TEST_MODE'].to_s == "true"
  Eleyo::API.testmode = true
end

if ENV['ELEYO_GEM_DEV_MODE'].to_s == "true"
  Eleyo::API.devmode = true
end

if ENV.has_key?("DEV_HOST")
  HOSTNAME = ENV.fetch("DEV_HOST")
elsif RUBY_PLATFORM =~ /darwin/
  HOSTNAME = "#{`scutil --get LocalHostName`.downcase.strip}.local"
else
  HOSTNAME = `hostname`.downcase.strip
end