class CreateDashes < ActiveRecord::Migration[7.1]
  def change
    create_table :dashes do |t|
      t.decimal :eur
      t.decimal :chf
      t.decimal :gbp
      t.decimal :usd
      t.decimal :jpy
      t.decimal :cny
      t.decimal :kwd
      t.decimal :inr

      t.timestamps
    end
  end
end
