Sailsd
======

Build status: [![BuildStatus](https://travis-ci.org/sails-simulator/sailsd.svg?branch=master)](https://travis-ci.org/sails-simulator/sailsd)

Sailsd is a simple daemon which simulates a small sailing boat in real time
using [libsailing](https://github.com/sails-simulator/libsailing).
Information about the boat's current sensor readings (position, heading and
wind conditions), and commands to move the rudder and sails can be accessed
over a socket.

The intended purpose of sailsd is to be a component of a testing framework for
evaluating the behaviour of autonomous sailing boats.

Protocol
--------

Sailsd uses a simple protocol consisting of JSON blobs sent over TCP.

Example valid messages to send to sailsd:

    {"request": ["version"]}

    {"request": ["latitude"]}

    {"request": ["latitude", "longitude"]}

    {"set": {"rudder": 0}}

    {"set": {"rudder": 0, "sail": 10}}

    {"set": {"latitude": 0, "longitude": 0}}

    {"set": {"running": false}}


Installing locally
------------------

Make sure `libsailing` is installed by cloning this repository with

    $ git clone --recursive https://github.com/sails-simulator/sailsd.git

Install dependencies (jansson for JSON parsing):

### Debian and ubuntu

    $ sudo apt install libjansson-dev

### Fedora and other red hat distros

    $ sudo dnf install jansson-devel

### NixOS

    $ nix-shell --pure -p pkgconfig jansson

Then compile using make:

    $ make

Alternatively, install Nix and run

    $ nix-env -i sailsd

Build and run with Docker
------------------------------

    $ docker build -t quay.io/sails/sailsd .
    $ docker run -p 3333:3333 quay.io/sails/sailsd
    $ echo '{"request": ["version"]}' | nc localhost 3333
      {"version": "1.0"}

Code styling
------------

Sailsd uses astyle to automate style conformity. Run:

    $ astyle --style=google --indent-switches sailsd.c

Licence
-------

Copyright © 2014-2017 Louis Taylor

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program.  If not, see <http://www.gnu.org/licenses/>.
