class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :autor
      t.text :message
      t.references :campaign, index: true

      t.timestamps
    end
  end
end
