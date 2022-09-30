namespace :dev do
  desc "Setting up the environment and populating the database "
  task setup: :environment do
    # loop to populate the database in Manager table 
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

    # loop to populate the database in Transfermarkt table 
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

    # loop to populate the database in Player table 
    puts "Simulating of data logging in the database for players started..."
    Manager.all.each do |manager|
      16.times do |i|
        player = Player.create!(name: Faker::Sports::Football.player,position: Faker::Sports::Football.position,last_competition: Faker::Sports::Football.competition)
        manager.players << player
        manager.save!
      end
    end

    Transfermarkt.all.each do |transfermarkt|
      26.times do |i|
        player = Player.create!(
          name: Faker::Sports::Football.player,
          position: Faker::Sports::Football.position,
          last_competition: Faker::Sports::Football.competition
        )
        transfermarkt.players << player
        transfermarkt.save!
      end
    end

    puts "Successfully registered players through registration simulation!"
  end

end
