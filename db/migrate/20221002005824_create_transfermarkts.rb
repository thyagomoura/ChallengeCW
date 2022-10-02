class CreateTransfermarkts < ActiveRecord::Migration[7.0]
  def change
    create_table :transfermarkts do |t|
      t.string :description
      t.string :crypto
      t.string :timezone

      t.timestamps
    end
  end
end
