class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @review = Review.where("product_id = #{params[:id]}")
    @users = User.all
    @newreview = Review.new
  end

end
