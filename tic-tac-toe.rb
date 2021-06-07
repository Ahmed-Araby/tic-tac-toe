=begin 

# design prcoess

entities

board 
players 
markers 



actions 
start game
place marker 
check for winning   -- algoriothm that will work on the board.
end game 


board should depend in the winning algorithm abstract class


classes 
board class
winning algorithm class 
player class 
game controller class
    - configure 
    - manage the game 
    - check for winning

=end

require "./GameController.rb"

gameController = GameController.new 
gameController.start

puts "***** Game Over *****"

