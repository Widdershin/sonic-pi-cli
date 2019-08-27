require 'socket'
require 'rubygems'
require 'osc-ruby'
require 'securerandom'

class SonicPi
  def initialize(port=4557)
    @port=port
  end

  RUN_COMMAND = "/run-code"
  STOP_COMMAND = "/stop-all-jobs"
  SERVER = 'localhost'
  GUI_ID = 'SONIC_PI_CLI'
  


  def run(command)
    send_command(RUN_COMMAND, command)
  end

  def stop
    send_command(STOP_COMMAND)
  end

  def test_connection!
    begin
      socket = UDPSocket.new
      socket.bind(nil, @port)
      abort("ERROR: Sonic Pi is not listening on #{@port} - is it running?")
    rescue
      # everything is good
    end
  end

  private

  def client
    @client ||= OSC::Client.new(SERVER, @port)
  end

  def send_command(call_type, command=nil)
    prepared_command = OSC::Message.new(call_type, GUI_ID, command)
    client.send(prepared_command)
  end
end
