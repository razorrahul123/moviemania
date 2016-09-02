class ReviewsController < ApplicationController
  before_action :find_play

  def new
    @play = Play.find(params[:play_id])
    @review = Review.new
  end

  def create
    @play = Play.find(params[:play_id])
    @review = Review.new(params.require(:review).permit(:rating, :comment))
    @review.play_id = @play.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to play_path(@play)
    else
      render 'new'
    end
  end

  private

    def review_params
      params.require(:review).permit(:rating, :comment)
    end

    def find_play
      @play = Play.find(params[:play_id])
    end
end
