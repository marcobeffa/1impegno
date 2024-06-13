class DropLinkcontentsTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :linkcontents
  end
end
