require 'minitest/autorun'
require 'minitest/pride'
require '../lib/mastermind'

class MastermindTest < Minitest::Test
  def setup
    messages = Messages.new
    @master = Mastermind.new(messages)
  end
  def test_it_exists
    assert MastermindTest
  end
  def test_it_starts_a_game
    assert @master.answer.nil?
    message, signal = @master.execute('p')
    assert @master.answer.is_a?(Array)
    assert message.include? ('Take your best guess')
    assert_equal signal, :continue
  end
  def test_it_creates_an_answer
    @master.execute('p')
    rand_answer = @master.answer
    new_message = Messages.new
    new_master = Mastermind.new(new_message)
    new_master.execute('p')
    new_answer = new_master.answer
    rand_answer != new_answer
  end

  def test_it_wins
    skip
    mm = Mastermind.new
    result = mm.execute("BBGB")
    assert result.downcase.include?("win")
  end
end
