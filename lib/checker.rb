class Checker
  attr_reader :guess, :answer

  def initialize(guess, answer)
    @guess  = guess.upcase
    @answer = answer.upcase
  end

  def correct?
    guess == answer
  end

  def guess_too_short?
    guess.length < 4
  end

  def guess_too_long?
    guess.length > 4
  end

  def color_check
    colors = guess.chars.select { |letter| answer.include?(letter) }
    colors.uniq.length
  end

  def position_check
    letter_pairs  = guess.chars.zip(answer.chars)
    correct_pairs = letter_pairs.select { |pair| pair[0] == pair[1] }
    correct_pairs.length
  end
end
