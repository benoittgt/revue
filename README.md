revue
=====

[![Build Status](https://travis-ci.org/benoittgt/revue.svg?branch=mongo_spec)](https://travis-ci.org/benoittgt/revue)

Irc logger bot with api with sinatra.

![Screenshot](https://i.imgur.com/5KDKoHP.png)

## To use it

* git clone the repo
* install mongodb
* go into the repo
* `bundle install`
* start the bot : `ruby revuebot.rb`
* start the server : `ruby webserver.rb`

### To Do (with TDD)

* [X] Log with cinch
* [X] Plug Mongodb
* [X] Enable cinch [loggin](https://github.com/cinchrb/cinch/blob/48ea90d25f0d46ca4c4aba8fe1934e5cc6210a5e/docs/logging.md)
* [X] Build API with Sinatra
* [X] Nice front with base.io or foundation with some D3.js
* [ ] Work on perf, indexing
* [ ] add D3.js tip

### Licence

The MIT License (MIT)

Copyright (c) 2014 Benoit

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

