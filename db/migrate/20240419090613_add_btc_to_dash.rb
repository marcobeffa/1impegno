class AddBtcToDash < ActiveRecord::Migration[7.1]
  def change
    add_column :dashes, :btc, :float
    add_column :dashes, :bch, :float
    add_column :dashes, :eth, :float
    add_column :dashes, :ltc, :float
    add_column :dashes, :eos, :float
    add_column :dashes, :xlm, :float
    add_column :dashes, :dot, :float
    add_column :dashes, :link, :float

    remove_column :dashes, :cny, :decimal
    remove_column :dashes, :kwd, :decimal
    remove_column :dashes, :inr, :decimal

 
  end
end
