class RemoveFieldToDash < ActiveRecord::Migration[7.1]
  def change
    remove_column :dashes, :bch, :float
    remove_column :dashes, :xlm, :float

  end
end
