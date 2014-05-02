module InputHelper
  extend self

  def ask_for_new_game(input_stream = $stdin, output_stream = $stdout)
    output_stream.puts 'Do you want to start a new game ? [y/n]'
    answer = input_stream.gets.chomp.downcase
  end

  def ask_for_next_location(input_stream = $stdin, output_stream = $stdout)
    output_stream.puts 'Please enter your move (between 1 and 9) :'
    next_location = input_stream.gets.chomp.to_i - 1
  end
end
