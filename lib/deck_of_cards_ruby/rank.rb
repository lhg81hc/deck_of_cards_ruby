module DeckOfCardsRuby
  class Rank

    TRANSLATIONS = {
      '2' => 'two',
      '3' => 'three',
      '4' => 'four',
      '5' => 'five',
      '6' => 'six',
      '7' => 'seven',
      '8' => 'eight',
      '9' => 'nine',
      '10' => 'ten',
      'j' => 'jack',
      'q' => 'queen',
      'k' => 'king',
      'a' => 'ace',
    }

    UNICODE_LONGITUDE = {
      'a' => '1',
      '2' => '2',
      '3' => '3',
      '4' => '4',
      '5' => '5',
      '6' => '6',
      '7' => '7',
      '8' => '8',
      '9' => '9',
      '10' => 'A',
      'j' => 'B',
      'q' => 'D',
      'k' => 'E',
    }

    def initialize(val)
      @val = val.to_s
      validate
    end

    def validate
      raise 'Invalid rank' unless TRANSLATIONS.keys.include?(@val)
    end

    def to_s
      TRANSLATIONS[@val]
    end

    def to_unicode_longitude
      UNICODE_LONGITUDE[@val]
    end
  end
end
