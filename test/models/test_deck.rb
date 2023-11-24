# frozen_string_literal: true

require 'minitest/autorun'
require 'test_helper'

class TestDeck < Minitest::Test
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def initialized_deck
    [
      DeckOfCardsRuby::Card.new('2', 'hearts'), DeckOfCardsRuby::Card.new('2', 'diamonds'),
      DeckOfCardsRuby::Card.new('2', 'clubs'), DeckOfCardsRuby::Card.new('2', 'spades'),
      DeckOfCardsRuby::Card.new('3', 'hearts'), DeckOfCardsRuby::Card.new('3', 'diamonds'),
      DeckOfCardsRuby::Card.new('3', 'clubs'), DeckOfCardsRuby::Card.new('3', 'spades'),
      DeckOfCardsRuby::Card.new('4', 'hearts'), DeckOfCardsRuby::Card.new('4', 'diamonds'),
      DeckOfCardsRuby::Card.new('4', 'clubs'), DeckOfCardsRuby::Card.new('4', 'spades'),
      DeckOfCardsRuby::Card.new('5', 'hearts'), DeckOfCardsRuby::Card.new('5', 'diamonds'),
      DeckOfCardsRuby::Card.new('5', 'clubs'), DeckOfCardsRuby::Card.new('5', 'spades'),
      DeckOfCardsRuby::Card.new('6', 'hearts'), DeckOfCardsRuby::Card.new('6', 'diamonds'),
      DeckOfCardsRuby::Card.new('6', 'clubs'), DeckOfCardsRuby::Card.new('6', 'spades'),
      DeckOfCardsRuby::Card.new('7', 'hearts'), DeckOfCardsRuby::Card.new('7', 'diamonds'),
      DeckOfCardsRuby::Card.new('7', 'clubs'), DeckOfCardsRuby::Card.new('7', 'spades'),
      DeckOfCardsRuby::Card.new('8', 'hearts'), DeckOfCardsRuby::Card.new('8', 'diamonds'),
      DeckOfCardsRuby::Card.new('8', 'clubs'), DeckOfCardsRuby::Card.new('8', 'spades'),
      DeckOfCardsRuby::Card.new('9', 'hearts'), DeckOfCardsRuby::Card.new('9', 'diamonds'),
      DeckOfCardsRuby::Card.new('9', 'clubs'), DeckOfCardsRuby::Card.new('9', 'spades'),
      DeckOfCardsRuby::Card.new('10', 'hearts'), DeckOfCardsRuby::Card.new('10', 'diamonds'),
      DeckOfCardsRuby::Card.new('10', 'clubs'), DeckOfCardsRuby::Card.new('10', 'spades'),
      DeckOfCardsRuby::Card.new('j', 'hearts'), DeckOfCardsRuby::Card.new('j', 'diamonds'),
      DeckOfCardsRuby::Card.new('j', 'clubs'), DeckOfCardsRuby::Card.new('j', 'spades'),
      DeckOfCardsRuby::Card.new('q', 'hearts'), DeckOfCardsRuby::Card.new('q', 'diamonds'),
      DeckOfCardsRuby::Card.new('q', 'clubs'), DeckOfCardsRuby::Card.new('q', 'spades'),
      DeckOfCardsRuby::Card.new('k', 'hearts'), DeckOfCardsRuby::Card.new('k', 'diamonds'),
      DeckOfCardsRuby::Card.new('k', 'clubs'), DeckOfCardsRuby::Card.new('k', 'spades'),
      DeckOfCardsRuby::Card.new('a', 'hearts'), DeckOfCardsRuby::Card.new('a', 'diamonds'),
      DeckOfCardsRuby::Card.new('a', 'clubs'), DeckOfCardsRuby::Card.new('a', 'spades')
    ]
  end
  # rubocop:enable Metrics/AbcSize

  def setup
    @deck = DeckOfCardsRuby::Deck.new
  end

  def test_to_s_returns_translation_of_all_the_cards
    expected = "two of hearts, two of diamonds, two of clubs, two of spades, "\
               "three of hearts, three of diamonds, three of clubs, three of spades, "\
               "four of hearts, four of diamonds, four of clubs, four of spades, five of hearts, "\
               "five of diamonds, five of clubs, five of spades, six of hearts, six of diamonds, "\
               "six of clubs, six of spades, seven of hearts, seven of diamonds, seven of clubs, "\
               "seven of spades, eight of hearts, eight of diamonds, eight of clubs, "\
               "eight of spades, nine of hearts, nine of diamonds, nine of clubs, nine of spades, "\
               "ten of hearts, ten of diamonds, ten of clubs, ten of spades, jack of hearts, "\
               "jack of diamonds, jack of clubs, jack of spades, queen of hearts, queen of diamonds, "\
               "queen of clubs, queen of spades, king of hearts, king of diamonds, king of clubs, "\
               "king of spades, ace of hearts, ace of diamonds, ace of clubs, ace of spades"

    assert_equal expected, @deck.to_s
  end
  # rubocop:enable Metrics/MethodLength

  def test_remaining_returns_an_array_of_remaining_cards
    assert_equal @deck.remaining.count, 52
    @deck.remaining.each_with_index { |card, index| assert_equal(initialized_deck[index].to_s, card.to_s) }

    @deck.take_cards(51)
    assert_equal @deck.remaining.count, 1
  end

  def test_draw_top_to_return_the_card_on_the_top_of_the_deck
    card = @deck.draw('top')
    assert_equal card.to_s, 'two of hearts'
  end

  def test_draw_bottom_to_return_the_card_at_the_top_of_the_deck
    card = @deck.draw('bottom')
    assert_equal card.to_s, 'ace of spades'
  end

  def test_pick_a_card_that_is_in_the_deck
    card = @deck.pick('q', 'hearts')
    assert_equal card.to_s, 'queen of hearts'
  end

  def test_pick_a_card_which_has_invalid_rank_to_raise_error
    assert_raises(RuntimeError) { @deck.pick('bar', 'hearts') }
  end

  def test_pick_a_card_which_has_invalid_suite_to_raise_error
    assert_raises(RuntimeError) { @deck.pick('10', 'hear') }
  end

  def test_pick_a_card_that_is_not_in_the_deck
    (1..51).to_a.map { |_n| @deck.draw('top') }

    assert_equal @deck.remaining.count, 1
    remaining_card = @deck.remaining.first
    assert_equal remaining_card.to_s, 'ace of spades'

    card = @deck.pick('j', 'diamonds')
    assert_nil card
  end

  def test_empty_to_return_false_if_remaining_cards_are_not_zero
    assert_equal false, @deck.empty?
  end

  def test_empty_to_return_true_if_remaining_cards_is_zero
    @deck.take_cards(52)
    assert_equal true, @deck.empty?
  end

  def test_take_a_card_from_a_not_empty_deck
    assert_equal @deck.remaining.count, 52
    card = @deck.take_a_card

    refute_nil card
    assert_equal @deck.remaining.count, 51
  end

  def test_take_a_card_from_an_empty_deck
    assert_equal @deck.remaining.count, 52
    @deck.take_cards(52)

    assert_equal true, @deck.empty?

    card = @deck.take_a_card
    assert_nil card
  end
end
