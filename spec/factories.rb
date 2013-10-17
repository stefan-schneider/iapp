FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}"}
    sequence(:email) { |n| "person_#{n}@example.com"}
    password  "aberdeen"
    password_confirmation "aberdeen"
    
    factory :admin do
      admin true
    end
  end
  
  factory :micropost do
    content "Content goes here"
    user
  end
end