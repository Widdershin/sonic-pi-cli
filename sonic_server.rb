require 'rubygems'
require 'osc-ruby'
require 'osc-ruby/em_server'

class SonicServer
  PORT = 4558

  def initialize
    @server = OSC::EMServer.new(PORT)
  end

  def run
    puts "Listening on #{PORT}"

    @server.add_method('*') do |message|
      puts "Sonic Pi: #{message.to_a}"
    end

    @server.run
  end
end

SonicServer.new.run
