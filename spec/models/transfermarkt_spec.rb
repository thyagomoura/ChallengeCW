require 'rails_helper'

RSpec.describe Transfermarkt, type: :model do

    before(:all) do
        @transfermarkt = Transfermarkt.create(
            description: 'Transfermarkt is transfer window', 
            crypto: '205d8a1d74efb5d91a8fa5f91de63f',
            timezone: 'Europe/Helsinki'
        )
    end

    it 'check that transfermarkt can be created' do
        expect(@transfermarkt).to be_valid
    end

    it 'check that transfermarkt can be read' do
        expect(Transfermarkt.find_by crypto: '205d8a1d74efb5d91a8fa5f91de63f').to eq(@transfermarkt)
    end

    it 'check that transfermarkt can be updated' do
        @transfermarkt.update(:crypto => 'update_205d8a1d74efb5d91a8fa5f91de63f')
        expect(Transfermarkt.find_by crypto: 'update_205d8a1d74efb5d91a8fa5f91de63f').to eq(@transfermarkt)
    end

    it 'check that transfermarkt can be destroyed' do
        @transfermarkt.destroy
        expect(Transfermarkt.count).to eq(0)
    end

    after(:all) do
        @transfermarkt.destroy
    end
end