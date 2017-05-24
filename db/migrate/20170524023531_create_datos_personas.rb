class CreateDatosPersonas < ActiveRecord::Migration[5.0]
  def change
    create_table :datos_personas do |t|
      t.string :name
      t.string :country
      t.string :city
      t.boolean :receive_email

      t.timestamps
    end
  end
end
