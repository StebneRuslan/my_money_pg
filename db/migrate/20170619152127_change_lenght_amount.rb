class ChangeLenghtAmount < ActiveRecord::Migration
  def up
    add_column :balances, :amount, :decimal,  precision: 15, scale: 3
  end

  def down
    remove_column :balances, :amount
  end
end
