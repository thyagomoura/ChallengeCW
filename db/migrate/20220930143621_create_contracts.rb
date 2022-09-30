class CreateContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :contracts do |t|
      t.string :work_contract
      t.references :player, null: true, foreign_key: true

      t.timestamps
    end
  end
end
