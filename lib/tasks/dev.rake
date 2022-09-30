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

    puts "Simulating of data logging in the database for Transfermarkt started..."
    24.times do |i|
      Transfermarkt.create!(
        description: "Period during the year when a responsible person can transfer
                      players from another game team to his game team. This transfer is completed 
                      with the registration of the player in the new club through a contract",
        crypto: Faker::Crypto.sha256,
        timezone: Faker::Address.time_zone
      )
    end
    puts "Successfully registered Transfermarkt through registration simulation!"
  end

end
