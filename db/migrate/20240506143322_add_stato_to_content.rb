class AddStatoToContent < ActiveRecord::Migration[7.1]
  def change
    add_column :contents, :stato, :integer
  end
end
