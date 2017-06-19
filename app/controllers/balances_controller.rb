class BalancesController < ApplicationController

  def new
    categories = Category.arel_table
    @balance = Balance.new
    @categories = Category.where(categories[:category_type].eq(
        params['type']).and((categories[:user_id].eq(
        current_user.id)).or(categories[:user_id].eq(nil))))
  end

  def create
    @balance = Balance.create(params[:balance])
    @balance.date = Time.now
    @balance.user = current_user
    @balance.save
    respond_to do |format|
      format.js
      format.html { redirect_to :back }
    end
  end

  def destroy
    # @balance = Balance.all
    @balance = Balance.find(params[:id])
    @balance.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to :back }
    end
  end

  def edit
    @balance = Balance.find(params[:format])
  end

  def update
    @balance = Balance.find(params[:id])
    @balance.update_attributes(params[:balance])
    respond_to do |format|
      format.html { render :partial => 'balances/balance'}
    end
  end

  def get_balances
    @balances = Balance.all
    @balance_category = Balance.select("balances.*").joins(:category).where(
        "category_type = 'Expenditure' and (balances.user_id = #{current_user.id})").all.group_by(&:category_id)

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
    respond_to do |format|
      format.json { render json: @data }
    end
  end
end
