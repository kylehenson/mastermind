class Mastermind
  attr_reader :answer, :counter, :game_in_progress

  def initialize
    @answer           = create_answer
    @counter          = 0
    @game_in_progress = false
  end

  def create_answer
    letters = ["R", "G", "B", "Y"]
    answer = (0...4).map { letters[rand(4)] }
    answer.join('')
  end

  def execute(input)
    if game_in_progress
      play_game(input)
    else
      game_menu(input)
    end
  end

  def game_menu(input)
    puts answer
    case(input.downcase)
    when "quit" || "q"
      @game_in_progress = false
      [Message.quit, :stop]
    when "p" || "play"
      @game_in_progress = true
      [Message.start_game, :continue]
    when "i" || "instructions"
      @game_in_progress = false
      [Message.instructions, :continue]
    end
  end

  def play_game(input)
    puts answer
    if (input.downcase == 'q') || (input.downcase == 'quit')
      [Message.quit, :stop]
    else
      checker = Checker.new(input, answer)
      if checker.guess_too_short?
        [Message.guess_too_short, :continue]
      elsif checker.guess_too_long?
        [Message.guess_too_long, :continue]
      elsif checker.correct?
        @counter += 1
        [Message.end_game(input, @counter), :continue]
      else
        @counter += 1
        [Message.incorrect_guess(input, checker.color_check, checker.position_check, @counter), :continue]
      end
    end
  end

  ### If they enter p or play then they enter the game flow described below.
  ###
  ### Once the user starts a game they should see:
  ### I have generated a beginner sequence with four elements made up of: (r)ed,
  ### (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
  ### What's your guess?

  ### They can then enter a guess in the form rrgb
  ### Guesses are case insensitive
  ### If it’s 'q' or 'quit' then exit the game
  ### If it’s fewer than four letters, tell them it’s too short
  ### If it’s longer than four letters, tell them it’s too long
  ### If they guess the secret sequence, enter the end game flow below
  ### Otherwise give them feedback on the guess like this: 'RRGB' has 3 of the
  ### correct elements with 2 in the correct positions
  ### You've taken 1 guess

  ### Then let them guess again, repeating the game flow loop.



  ### When the user correctly guesses the sequence, output the following:
  ### Congratulations! You guessed the sequence 'GRRB' in 8 guesses over 4 minutes, 22 seconds.
  ### Do you want to (p)lay again or (q)uit?

  ### If they enter 'p' or 'play' then restart the game. 'q' or 'quit' ends the game.
end
