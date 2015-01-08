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
    case(input.downcase)
    when "quit" || "q"
      @game_in_progress = false
      [Message.quit, :stop]
    when "p" || "play"
      @counter = 0
      @start_time = Time.now
      @game_in_progress = true
      [Message.start_game, :continue]
    when "i" || "instructions"
      @game_in_progress = false
      [Message.instructions, :continue]
    end
  end

  def play_game(input)
    checker = Checker.new(input, answer)
    puts answer
    if (input.downcase == 'q') || (input.downcase == 'quit')
      [Message.quit, :stop]
    else
      if checker.guess_too_short?
        [Message.guess_too_short, :continue]
      elsif checker.guess_too_long?
        [Message.guess_too_long, :continue]
      elsif checker.correct?
        @counter += 1
        @game_in_progress = false
        @stop_time = Time.now
        @answer = create_answer
        [Message.end_game(input, @counter, time_keeper), :continue]
      else
        @counter += 1
        [Message.incorrect_guess(input, checker.color_check, checker.position_check, @counter), :continue]
      end
    end
  end

  def time_keeper
    @stop_time-@start_time
  end

end
