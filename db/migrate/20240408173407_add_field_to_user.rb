class AddFieldToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :avatar_url, :string
    add_column :users, :username, :string
    add_column :users, :nome_cognome, :string
    add_column :users, :telefono, :string
    add_column :users, :admin, :boolean
  end
end
