require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Stefan Schneider",
                         email: "stefan.schneider@zoho.com",
                         password: "60adam11",
                         password_confirmation: "60adam11",
                         admin: true)
                         
    User.create!( name: "Example User", 
                  email: "example@railstutorial.org",
                  password: "foobar",
                  password_confirmation: "foobar")
                    
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password = "pword123"
      User.create!( name: name,
                    email: email,
                    password: password,
                    password_confirmation: password)
    end
    
    users = User.all(limit: 10)
    50.times do
      content = Faker::Lorem.sentence(7)
      users.each { |user| user.microposts.create!(content: content) }
    end
  end
end