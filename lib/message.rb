module Message
  def self.welcome
    "Welcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def self.start_game
    "I have generated a beginner sequence with four elements made up of:\n(r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.\n\nTake your best guess!"
  end

  def self.instructions
    "I will generate a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow.\nGuess the correct sequence of the four elements in as few attempts as possible.\nUse (p)lay to start or (q)uit to end the game at any time."
  end

  def self.guess_too_short
    "Your guess is too short. Please enter 4 letters."
  end

  def self.guess_too_long
    "Your guess is too long. Please enter 4 letters."
  end

  def self.incorrect_guess(guess, number_of_correct_colors, number_of_correct_positions, number_of_guesses)
    "'#{guess}' has #{number_of_correct_colors} of the correct elements with #{number_of_correct_positions} in the correct positions. \nYou've taken #{number_of_guesses} guess(es)."
  end

  def self.quit
    "\nThanks for playing!"
  end

  def self.end_game(guess, number_of_guesses, total_time)
    "Congratulations! You guessed the sequence '#{guess}' in #{number_of_guesses} guesses over #{total_time} seconds!\nWould you like to (p)lay or (q)uit?"
  end
end
