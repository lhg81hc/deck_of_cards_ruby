# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'deck_of_cards_ruby/version'

Gem::Specification.new do |spec|
  spec.name = "deck_of_cards_ruby"
  spec.version = DeckOfCardsRuby::VERSION
  spec.authors = ["Thad Le"]
  spec.email = ["llengocthangg@gmail.com"]

  spec.summary = "Deck of cards in Ruby language"
  spec.description = "Simple gem that simulate a deck of card written in Ruby"
  spec.homepage = "https://github.com/lhg81hc/deck_of_cards_ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.2"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/lhg81hc/deck_of_cards_ruby"
  spec.metadata["changelog_uri"] = "https://github.com/lhg81hc/deck_of_cards_ruby"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  # spec.files = Dir.chdir(__dir__) do
  #   `git ls-files -z`.split("\x0").reject do |f|
  #     (File.expand_path(f) == __FILE__) ||
  #       f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
  #   end
  # end

  spec.files = [
    'lib/deck_of_cards_ruby.rb',
    'lib/deck_of_cards_ruby/card.rb',
    'lib/deck_of_cards_ruby/deck.rb',
    'lib/deck_of_cards_ruby/rank.rb',
    'lib/deck_of_cards_ruby/suit.rb',
    'lib/deck_of_cards_ruby/version.rb',
    'lib/deck_of_cards_ruby/constants/rank.rb',
    'lib/deck_of_cards_ruby/constants/suit.rb'
  ]
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
