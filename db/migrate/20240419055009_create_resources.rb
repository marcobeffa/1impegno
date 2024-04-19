class CreateResources < ActiveRecord::Migration[7.1]
  def change
    create_table :resources do |t|
      t.references :user, null: false, foreign_key: true
      t.string :tipo
      t.string :nome
      t.string :descrizione
      t.text :body
      t.string :img_url
      t.string :email
      t.string :telefono
      t.decimal :costo
      t.decimal :ricavo
      t.datetime :data
      t.integer :visibility
      t.integer :energy
      t.integer :importanza

      t.timestamps
    end
  end
end
