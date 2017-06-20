class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.decimal :amount, precision: 15, scale: 3
      t.string :balance_type
      t.date :date
      t.string :notes
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
