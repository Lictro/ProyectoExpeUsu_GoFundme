class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :autor
      t.string :message
      t.integer :campaign_id

      t.timestamps
    end
  end
end
