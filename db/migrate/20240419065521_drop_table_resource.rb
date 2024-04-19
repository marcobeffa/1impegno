class DropTableResource < ActiveRecord::Migration[7.1]
  def change
    drop_table :resources
  end
end
