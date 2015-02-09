A simple and functional CLI for Sonic Pi, written in Ruby.

Installation
-------

    gem install sonic-pi-cli

Usage
-----

Sonic Pi must be running, as this is just a client.

    sonic_pi play 50
    sonic_pi sample :loop_breakbeat, rate: 0.5
    sonic_pi stop

or

    echo 'sample :loop_amen' | sonic_pi
    echo music.rb | sonic_pi

or

    $ irb

    irb(main):001:0> require 'sonic_pi'
    => true
    irb(main):002:0> SonicPi.new.run('play [50, 55, 60]')
    => 36

License
------

sonic-pi-cli  is released under the MIT license. See LICENSE for more details.

Todo
----

- [ ] Tests
- [x] Command line help
- [x] Stop command

