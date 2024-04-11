class AddFieldToContent < ActiveRecord::Migration[7.1]
  def change
    add_column :contents, :data, :datetime
  end
end
