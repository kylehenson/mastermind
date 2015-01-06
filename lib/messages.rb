class Messages
  def welcome
    "Welcome to Mastermind \nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end
  def take_guess
    "Take your best guess!"
  end
  def instructions
    "I will generate a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow.\nGuess the correct sequence of the four elements in as few attempts as possible.\nUse (p)lay to start or (q)uit to end the game at any time."
  end
  def quit
    "Thanks for playing."
  end
  def end_game
    "Maybe your luck will be better tomorrow."
  end
end
