class AddNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users,:city, :string
    add_column :users, :country, :string
    add_column :users, :receive_emails, :boolean, default: false
  end
end
