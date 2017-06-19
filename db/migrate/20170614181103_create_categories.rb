class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :type
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
