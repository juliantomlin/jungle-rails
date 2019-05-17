class ReviewsController < ApplicationController

  before_action :require_login

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.product_id = (params[:product_id])

    @review.save

    if @review.save
      redirect_to product_url(params[:product_id])
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

  def require_login
    unless current_user
      flash[:error] = "please login first"
      redirect_to login_url
    end
  end

end
