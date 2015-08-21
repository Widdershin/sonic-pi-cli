require 'socket'
require 'rubygems'
require 'osc-ruby'
require 'securerandom'

class SonicPi
  RUN_COMMAND = "/run-code"
  STOP_COMMAND = "/stop-all-jobs"
  SERVER = 'localhost'
  PORT = 4557
  GUI_ID = SecureRandom.uuid

  def run(command)
    client.send(run_command(command))
  end

  def stop
    client.send(stop_command)
  end

  def test_connection!
    begin
      OSC::Server.new(PORT)
      abort("ERROR: Sonic Pi is not listening on #{PORT} - is it running?")

    rescue
      # everything is good
    end
  end

  private

  def client
    client ||= OSC::Client.new(SERVER, PORT)
  end

  def run_command(command)
    OSC::Message.new(RUN_COMMAND, GUI_ID, "#{command}")
  end

  def stop_command
    OSC::Message.new(STOP_COMMAND, GUI_ID)
  end
end

