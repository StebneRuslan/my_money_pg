class WelcomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @balances = Balance.all
    @currentUser = current_user.id
    @balance_category = Balance.select("balances.*").joins(:category).where(
        "category_type = 'Expenditure' and (balances.user_id = #{@currentUser})").all.group_by(&:category_id)

    @data = []

    @balance_category.each do |c|
      bal = 0
      category = Category.find(c[0]).name
      c[1].each do |balances|
        bal += balances.amount.to_d
      end
      @data.push({name: category, y: bal})
    end
    @data = @data.to_json
    @categories = Category.all
  end

end
