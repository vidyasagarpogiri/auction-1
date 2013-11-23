namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    password = "112233"
    User.create!(name: "Example User",
                 email: "a@a.ru",
                 admin: true,
                 password: password,
                 password_confirmation: password)
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@test.ru"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end

