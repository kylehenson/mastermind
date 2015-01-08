require_relative 'test_helper'
require_relative '../lib/checker'

class CheckerTest < Minitest::Test

  def test_it_exists
    checker = Checker.new("", "")
    assert checker
  end

  def test_guess_is_correct
    guess = 'rgrb'
    answer = 'rgrb'
    checker = Checker.new(guess, answer)
    assert checker.correct?
  end

  def test_guess_is_incorrect
    guess = 'rgrb'
    answer = 'yyyy'
    checker = Checker.new(guess,answer)
    refute checker.correct?
  end

  def test_number_of_correct_colors_in_guess
    guess = 'rgrb'
    answer = 'rgyy'
    checker = Checker.new(guess, answer)
    assert_equal 2, checker.color_check
  end

  def test_number_of_correct_positions
    guess = 'rgrb'
    answer = 'rgyr'
    checker = Checker.new(guess,answer)
    assert_equal 2, checker.position_check
  end

  def test_if_number_of_characters_is_too_short
    guess   = 'r'
    answer  = 'rgby'
    checker = Checker.new(guess, answer)
    assert_equal true, checker.guess_too_short?
  end

  def test_if_number_of_characters_is_not_too_short
    guess   = 'rrggbbyy'
    answer  = 'rgby'
    checker = Checker.new(guess, answer)
    assert_equal false, checker.guess_too_short?
  end

  def test_if_number_of_characters_is_too_long
    guess   = "rgrgr"
    answer  = "rgyy"
    checker = Checker.new(guess, answer)
    assert_equal true, checker.guess_too_long?
  end

  def test_if_number_of_characters_is_not_too_long
    guess   = 'rr'
    answer  = 'rgby'
    checker = Checker.new(guess, answer)
    assert_equal false, checker.guess_too_long?
  end

  def test_it_rejects_invalid_input
    guess   = 't'
    answer  = 'rgby'
    checker = Checker.new(guess, answer)
    assert checker.invalid_input
  end

end
