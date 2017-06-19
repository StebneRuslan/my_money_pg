class ChangeCategoryType < ActiveRecord::Migration
  def up
    remove_column :categories, :type
    add_column :categories, :category_type, :string
  end

  def down
    remove_column :categories, :category_type
    add_column :categories, :type, :string
  end
end
