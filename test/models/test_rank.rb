# frozen_string_literal: true

require 'minitest/autorun'
require 'test_helper'

module TestRank
  class TestValidRank < Minitest::Test
    def setup
      @rank = DeckOfCardsRuby::Rank.new('q')
    end

    def test_that_validation_will_not_raise_error
      assert_nil @rank.validate
    end

    def test_to_s_returns_matched_key_from_translation_map
      assert_equal 'queen', @rank.to_s
    end

    def test_to_unicode_longitude_returns_matched_key_from_unicode_longitude
      assert_equal 'D', @rank.to_unicode_longitude
    end
  end

  class TestInvalidRank < Minitest::Test
    def test_that_will_raise_error_when_initialize_with_an_invalid_value
      assert_raises(RuntimeError) { DeckOfCardsRuby::Rank.new('bar') }
    end
  end
end
