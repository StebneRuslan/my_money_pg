class Category < ActiveRecord::Base
  attr_accessible :name, :category_type
  belongs_to :user
  has_many :balances

  validates :name, :category_type, presence: true
end
