class CreateManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :managers do |t|
      t.string :name
      t.string :email
      t.string :nationality
      t.string :workteam

      t.timestamps
    end
  end
end
