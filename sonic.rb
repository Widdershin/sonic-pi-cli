require 'rubygems'
require 'osc-ruby'

class SonicCli
  RUN_COMMAND = "/run-code"
  SERVER = 'localhost'
  PORT = 4557

  def initialize(command)
    @command = command
  end

  def run
    p client.send(osc_command)
  end

  private

  def client
    OSC::Client.new(SERVER, PORT)
  end

  def osc_command
    OSC::Message.new(RUN_COMMAND, "#{@command}\n")
  end
end

SonicCli.new(ARGV.join(' ')).run
