namespace :dev do
  desc "Setting up the environment and populating the database "
  task setup: :environment do
    puts "Simulating of data logging in the database for manager started..."
    50.times do |i|
      Manager.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        nationality:Faker::Nation.nationality,
        workteam: Faker::Sports::Football.team
      )
    end
    puts "Successfully registered manager through registration simulation!"
  end

end
