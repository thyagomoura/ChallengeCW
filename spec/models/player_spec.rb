require 'rails_helper'

RSpec.describe Player, type: :model do

    before(:all) do
        @player = Player.create(
            name: 'Player name', 
            position: 'Full Back',
            last_competition: 'Competition',
            contract: 'Contract number, if any'
        )
    end

    it 'check that player can be created' do
        expect(@player).to be_valid
    end

    it 'check that player can be read' do
        expect(Player.find_by last_competition: 'Competition').to eq(@player)
    end

    it 'check that player can be updated' do
        @player.update(:name => 'Name from Manager')
        expect(Player.find_by name: 'Name from Manager').to eq(@player)
    end

    it 'check that player can be destroyed' do
        @player.destroy
        expect(Player.count).to eq(0)
    end

    after(:all) do
        @player.destroy
    end
end