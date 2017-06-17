class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.string :autor
      t.string :message
      t.decimal :amount
      t.references :campaign, index: true
      t.timestamps
    end
  end
end
