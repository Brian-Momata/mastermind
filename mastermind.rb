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
and N(navy). Duplicates are NOT allowed. The colors W(white) and R(red) are reserved
for clues. R means that you have the right color in the right position and W
means you have the right color but in wrong position"
    puts '------------------------------'
    puts '___Clues example___'
    puts "suppose the code is 'BGOY' and your guess is 'BYPO'. The hint will be
HINT: 'RWW'. This means you have 1 right color in right position and 2 right
colors but in wrong positions."
    puts '------------------------------'
  end
end

class Mastermind
  include Text
  COLORS = ['B','O','Y','G','P','N']
  def initialize codebreaker
    intro
    rules
    game(codebreaker)
  end

  private

  def game(codebreaker)
    tries = 1
    code = COLORS.sample(4)
    while tries <= 12
      puts "TRY: #{tries}"
      guess = codebreaker.guess
      if guess == code
        puts 'Correct! That is the code'
        break
      elsif tries == 12 && guess != code
        puts "You're out of moves"
        puts "The code is #{code}"
      else
      puts 'Try Again'
      puts "CLUE: #{hint(code, guess)}"
      end
      tries += 1
    end
  end

  def hint(code, guess)
    hint = []
    guess.each do |col|
      hint << 'R' if code.include?(col) && code.index(col) == guess.index(col)
      hint << 'W' if code.include?(col) && code.index(col) != guess.index(col)
    end
    hint.sort.join
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
