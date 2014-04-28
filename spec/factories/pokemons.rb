# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pokemon do
    name "MyString"
    hp_base 1
    attack_base 1
    defense_base 1
    special_attack_base 1
    special_defense_base 1
    speed_base 1
  end
end
