class Balance < ActiveRecord::Base
  attr_accessible :amount, :notes, :category_id
  belongs_to :category
  belongs_to :user

  validates :amount, presence: true

end
