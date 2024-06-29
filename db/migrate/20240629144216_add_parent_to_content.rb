class AddParentToContent < ActiveRecord::Migration[7.1]
  def change
    add_column :contents, :parent_id, :integer
  end
end
