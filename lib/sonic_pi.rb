require 'socket'
require 'rubygems'
require 'osc-ruby'
require 'securerandom'

class SonicPi
  RUN_COMMAND = "/run-code"
  STOP_COMMAND = "/stop-all-jobs"
  SERVER = 'localhost'
  PORT = 4557
  GUI_ID = 'SONIC_PI_CLI'

  def run(command)
    send_command(RUN_COMMAND, command)
  end

  def stop
    send_command(STOP_COMMAND)
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
    @client ||= OSC::Client.new(SERVER, PORT)
  end

  def send_command(call_type, command=nil)
    prepared_command = OSC::Message.new(call_type, GUI_ID, command)
    client.send(prepared_command)
  end
end
