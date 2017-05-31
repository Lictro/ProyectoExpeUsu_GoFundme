class CreateCampaigns < ActiveRecord::Migration[5.0]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :description
      t.text :review
      t.decimal :goal
      t.string :category
      t.integer :user_id
      t.integer :likes
      t.date :finalized_in
      t.timestamps
    end
  end
end
