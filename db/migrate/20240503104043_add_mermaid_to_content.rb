class AddMermaidToContent < ActiveRecord::Migration[7.1]
  def change
    add_column :contents, :mermaid, :text
  end
end
