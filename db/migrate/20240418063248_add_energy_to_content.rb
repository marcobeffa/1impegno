class AddEnergyToContent < ActiveRecord::Migration[7.1]
  def change
    add_column :contents, :energy, :integer
    add_column :contents, :importanza, :integer
  end
end
