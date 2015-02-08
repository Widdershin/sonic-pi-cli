#!/usr/bin/env ruby

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
    client.send(osc_command)
  end

  private

  def client
    OSC::Client.new(SERVER, PORT)
  end

  def osc_command
    OSC::Message.new(RUN_COMMAND, "#{@command}")
  end
end

def stdin
  unless STDIN.tty?
    $stdin.each_line.to_a.join("\n")
  end
end

def args_and_stdin
  [
    ARGV.join(' '),
    stdin,
  ].join("\n")
end

SonicCli.new(args_and_stdin).run
