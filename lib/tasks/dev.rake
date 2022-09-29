namespace :dev do
  desc "Setting up the environment and populating the database "
  task setup: :environment do
    puts "Simulating of data logging in the database for player started..."
    50.times do |i|
      Player.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email
      )
    end
    puts "Successfully registered players through registration simulation!"
  end

end
