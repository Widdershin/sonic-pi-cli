
require 'rubygems'
require 'osc-ruby'

class SonicPi
  RUN_COMMAND = "/run-code"
  STOP_COMMAND = "/stop-all-jobs"
  SERVER = 'localhost'
  PORT = 4557

  def run(command)
    client.send(run_command(command))
  end

  def stop
    client.send(stop_command)
  end

  private

  def client
    client ||= OSC::Client.new(SERVER, PORT)
  end

  def run_command(command)
    OSC::Message.new(RUN_COMMAND, "#{command}")
  end

  def stop_command
    OSC::Message.new(STOP_COMMAND)
  end
end

