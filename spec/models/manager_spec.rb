require 'rails_helper'

RSpec.describe Manager, type: :model do

    before(:all) do
        @manager = Manager.create(
            name: 'Manager name', 
            email: 'emailManager@domain.com',
            nationality: 'Americans', 
            workteam: 'Workteam'
        )
    end

    it 'check that manager can be created' do
        expect(@manager).to be_valid
    end

    it 'check that manager can be read' do
        expect(Manager.find_by name: 'Manager name').to eq(@manager)
    end

    it 'check that manager can be updated' do
        @manager.update(:name => 'Name from Manager')
        expect(Manager.find_by name: 'Name from Manager').to eq(@manager)
    end

    it 'check that manager can be destroyed' do
        @manager.destroy
        expect(Manager.count).to eq(0)
    end

    after(:all) do
        @manager.destroy
    end
end