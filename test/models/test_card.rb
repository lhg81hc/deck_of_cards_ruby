# frozen_string_literal: true

require 'minitest/autorun'
require 'test_helper'

module TestCard
  class TestValidCard < Minitest::Test
    def setup
      @card = DeckOfCardsRuby::Card.new('a', 'spades')
    end

    def test_to_s_returns_translation_of_the_card
      assert_equal 'ace of spades', @card.to_s
    end

    def test_to_unicode_returns_unicode_of_the_card
      assert_equal '1F0A1', @card.unicode
    end

    def test_to_encoded_unicode_returns_full_unicode_of_the_card
      assert_equal "\u{1F0A1}", @card.to_encoded_unicode
    end
  end

  class TestCardWithInvalidSuit < Minitest::Test
    def test_that_will_raise_error_when_initialize_with_an_invalid_value
      assert_raises(RuntimeError) { DeckOfCardsRuby::Card.new('q', 'bar') }
    end
  end

  class TestCardWithInvalidRank < Minitest::Test
    def test_that_will_raise_error_when_initialize_with_an_invalid_value
      assert_raises(RuntimeError) { DeckOfCardsRuby::Card.new('foo', 'hearts') }
    end
  end
end
