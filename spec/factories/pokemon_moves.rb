# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pokemon_move do
    pokemon_id 1
    move_id 1
    learn_method 1
    level 1
  end
end
