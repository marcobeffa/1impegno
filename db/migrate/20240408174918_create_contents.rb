class CreateContents < ActiveRecord::Migration[7.1]
  def change
    create_table :contents do |t|
      t.references :user, null: true, foreign_key: true
      t.integer :tipo
      t.string :nome
      t.string :descrizione
      t.text :body
      t.string :img_url
      t.string :email
      t.string :telefono
      t.decimal :costo
      t.decimal :ricavo

      t.timestamps
    end
  end
end
