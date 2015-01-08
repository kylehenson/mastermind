require_relative 'test_helper'
require_relative '../lib/mastermind'


class MastermindTest < Minitest::Test
  attr_reader :input

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



  def test_game_quits_while_playing
    skip
    assert @master.answer.any?
    message, signal = @master.execute('q')
    assert message.include? ('Thanks for playing.')
    assert_equal signal, :stop
  end

  def test_quit_game_completely

  end
end
