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

    users = User.all(limit: 6)
    users.each do |user|
      title = Faker::Lorem.sentence(3)
      description = Faker::Lorem.sentence(10)
      price = 10500.50
      step = 100
      start = Date.today
      duration = 60*60*24*7

      user.products.create!(title: title,
                            description: description,
                            price: price,
                            step: step,
                            start_at: start,
                            duration: duration)
    end
  end
end
