require 'faker'

module Fffaker
  extend self

  def random_username
    [
      Faker::HarryPotter.character,
      Faker::StarWars.character,
      Faker::Pokemon.name,
      Faker::GameOfThrones.character
    ].sample
  end
end
