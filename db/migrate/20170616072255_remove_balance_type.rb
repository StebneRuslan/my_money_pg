class RemoveBalanceType < ActiveRecord::Migration
  def up
    remove_column :balances, :balance_type
  end

  def down
    add_column :balances, :balance_type, :string
  end
end
