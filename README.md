## Tic Tac Toe
[![Build Status](https://travis-ci.org/folieadrien/tic_tac_toe.svg)](https://travis-ci.org/folieadrien/tic_tac_toe)
[![Code Climate](https://codeclimate.com/github/folieadrien/tic_tac_toe.png)](https://codeclimate.com/github/folieadrien/tic_tac_toe)
[![Coverage Status](https://coveralls.io/repos/folieadrien/tic_tac_toe/badge.png?branch=master)](https://coveralls.io/r/folieadrien/tic_tac_toe?branch=master)

A Tic Tac Toe Game with unbeatable AI.

Run this command to launch the game from the `/bin` directory :

    ruby ./tic_tac_toe

Follow the instructions then.

### Board scheme

    1 | 2 | 3

    4 | 5 | 6

    7 | 8 | 9

Player start to play first.

Then :

It will switch players after a draw.

Player will play first after a loss.

### Tests

Run first :

    bundle install

Then :

    bundle exec rspec
