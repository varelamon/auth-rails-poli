# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :password do
    encrypted_password "MyString"
    user_id 1
  end
end
