class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @balances = @category.balances
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(params[:category])
    @category.user = current_user
    @category.save
    respond_to do |format|
      format.js
      format.html { redirect_to :back }
    end
  end

  def edit
    @category = Category.find(params[:format])
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(params[:category])
    respond_to do |format|
      format.html { render :partial => 'categories/category'}
    end
  end

  def destroy
    @category = Category.all
    @category = Category.find(params[:id])
    @category.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to :back }
    end
  end

end
