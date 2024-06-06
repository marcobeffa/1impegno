class CreateLinkcontents < ActiveRecord::Migration[7.1]
  def change
    create_table :linkcontents do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :content_1_id
      t.integer :content_2_id

      t.timestamps
    end
  end
end
