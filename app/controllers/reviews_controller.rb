class ReviewsController < ApplicationController
  before_action :load_restaurant


  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = @restaurant.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      render 'restaurants#show', notice: "Review posted successfully!"
    else

      render 'restaurants#show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
  end

  private
 def review_params
   params.require(:review).permit(:comment, :rating, :restaurant_id)
 end

 def load_restaurant
   @restaurant = Restaurant.find(params[:restaurant_id])
 end
end
