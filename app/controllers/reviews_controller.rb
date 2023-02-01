class ReviewsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    @review = Review.new(review_params)
    @review.list_id = @list.id
    if @review.save
      redirect_to list_path(@list)
    else
      render 'lists/show', status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
