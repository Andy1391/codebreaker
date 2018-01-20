require_relative 'game'
require_relative 'user'

include Codebreaker

# a = Game.new
# i.start
# # puts "Attempts: #{count}"
# # puts "secret code: #{i.start}"
# puts "user code: #{i.input_user_code}"
# # puts "user code: #{i.valid_input}"
# # puts "count plus : #{i.count_plus}"
# # puts "count minus : #{i.count_minus}"
# # puts "count_plus_and_minus : #{i.count_plus_and_minus}"
# # puts "One of code number: #{i.take_hint!}"
# # puts "hints : #{i.hint}"
# puts "hint! #{i.take_hint!}"
# i.attempts

# puts i.win?
"_________________________________________________________"
game = Codebreaker::Game.new
game.new_game

