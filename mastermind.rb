module Text
  def intro
    puts '==========MASTERMIND=========='
    puts "A code maker sets a code of 4 colors denoted by letters. A code breaker
 has 12 tries to guess the right configuration of the code. After each guess, the
code maker provides clues"
    puts '------------------------------'
  end

  def rules
    puts '==========RULES=========='
    puts "There are 6 color options B(blue),O(orange),Y(yellow),G(green),P(purple)
and N(navy). Duplicates are allowed. The colors W(white) and R(red) are reserved
for clues. R means that you have the right color in the right position and W
means you have the right color but in wrong position"
    puts '------------------------------'
    puts '___Clue example___'
    puts "suppose the code is 'BBOY' and your guess is 'BYBY'. The clues will be
Clues: 'RWW'. This means you have 1 right color in right position and 2 right
colors but in wrong positions."
    puts '------------------------------'
  end
end

class Mastermind
  include Text
  COLORS = [
    ['B', 'B', 'B', 'B'],
    ['O', 'O', 'O', 'O'],
    ['Y', 'Y', 'Y', 'Y'],
    ['G', 'G', 'G', 'G'],
    ['P', 'P', 'P', 'P'],
    ['N', 'N', 'N', 'N']
  ]
  def initialize codebreaker
    intro
    rules
    code = COLORS.flatten.sample(4)
    game(code, codebreaker)
  end

  private

  def game(code, codebreaker)
    tries = 1
    while tries <= 12
      puts "TRY: #{tries}"
      guess = codebreaker.guess
      if guess == code
        puts 'Correct! That is the code'
        break
      elsif tries == 12 && guess != code
        puts "You're out of moves"
      else
      puts 'Try Again'
      end
      tries += 1
    end
  end
end

class Player
  def guess
    puts 'What do you think the code is?'
    guess = gets.chomp.upcase.split('')
    guess
  end
end

codebreaker = Player.new
Mastermind.new(codebreaker)
