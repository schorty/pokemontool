# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :effect do
    type_id "MyString"
    target_type "MyString"
    factor "MyString"
  end
end
