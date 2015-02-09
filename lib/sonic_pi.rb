
require 'rubygems'
require 'osc-ruby'

class SonicPi
  RUN_COMMAND = "/run-code"
  SERVER = 'localhost'
  PORT = 4557

  def run(command)
    client.send(run_command(command))
  end

  private

  def client
    client ||= OSC::Client.new(SERVER, PORT)
  end

  def run_command(command)
    OSC::Message.new(RUN_COMMAND, "#{command}")
  end
end

