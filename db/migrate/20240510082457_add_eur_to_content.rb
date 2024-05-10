class AddEurToContent < ActiveRecord::Migration[7.1]
  def change
    add_column :contents, :costo_eur, :decimal
    add_column :contents, :ricavo_eur, :decimal
  end
end
