## Tic Tac Toe
[![Build Status](https://travis-ci.org/folieadrien/tic_tac_toe.svg)](https://travis-ci.org/folieadrien/tic_tac_toe)
[![Code Climate](https://codeclimate.com/github/folieadrien/tic_tac_toe.png)](https://codeclimate.com/github/folieadrien/tic_tac_toe)
[![Coverage Status](https://coveralls.io/repos/folieadrien/tic_tac_toe/badge.png?branch=master)](https://coveralls.io/r/folieadrien/tic_tac_toe?branch=master)

A Tic Tac Toe Game with unbeatable AI.

## Usage
Run this command to launch the game from the `/bin` directory :

    ruby bin/tic_tac_toe

Follow the instructions then.

### Board scheme

    1 | 2 | 3

    4 | 5 | 6

    7 | 8 | 9

Human player starts first.

Then :

It will switch players after a draw.

Human player will play first after a loss.

### Tests
Install dependencies:

    bundle install

Run:

    bundle exec rspec
