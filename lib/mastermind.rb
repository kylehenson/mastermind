require_relative 'messages'

class Mastermind
  attr_reader :game_in_progress, :messages
  attr_accessor :answer

  def initialize(messages)
    @messages = messages
    @game_in_progress = false
  end

  def create_answer
    letters = ["R", "G", "B", "Y"]
    # %w(R G B Y)
    (0...4).map { letters[rand(4)] }
  end

  def execute(input)
    if !game_in_progress
      game_menu(input)
    else
      play_game
    end
  end

  def game_menu(input)
    case(input.downcase)
    when "quit" || "q"
      @game_in_progress = false
      [messages.quit, :stop]
    when "p" || "play"
      @answer = create_answer
      @game_in_progress = true
      [messages.take_guess, :continue]
    when "i" || "instructions"
      @game_in_progress = false
      [messages.instructions, :continue]
    end
  end
  
  def play_game

  end
end
