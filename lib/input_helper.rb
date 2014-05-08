require 'stringio'

module InputHelper
  extend self

  def ask_for_new_game(input_stream = $stdin, output_stream = $stdout)
    output_stream.puts 'Do you want to start a new game ? [y/n]'
    input_stream.gets.chomp.downcase
  end

  def ask_for_next_location(input_stream = $stdin, output_stream = $stdout)
    output_stream.puts 'Please enter your move (between 1 and 9) :'
    input_stream.gets.chomp.to_i
  end
end
