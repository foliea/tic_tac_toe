module InputHelper
  extend self
  
  def ask_for_new_game
    puts '-- Do you want to start a new game ? [y/n] --'
    answer = gets.chomp.downcase
  end

  def ask_for_next_location
    puts '-- Please enter your move (between 1 and 9) : --'
    next_location = gets.chomp.to_i - 1
  end
end

