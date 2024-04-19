class RemoveTipoToResource < ActiveRecord::Migration[7.1]
  def change
    remove_column :resources, :tipo, :string
    add_column :resources, :tipo, :integer
  end
end
