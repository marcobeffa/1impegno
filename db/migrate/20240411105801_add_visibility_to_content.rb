class AddVisibilityToContent < ActiveRecord::Migration[7.1]
  def change
    add_column :contents, :visibility, :integer
  end
end
