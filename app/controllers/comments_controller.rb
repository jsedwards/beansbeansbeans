class CommentsController < ApplicationController
  before_action :set_listing
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def new
    @comment = @listing.comments.build
  end

  def create
    @comment = @listing.comments.build(comment_params)
    if @comment.save
      flash[:notice] = "Comment has been created."
      redirect_to [@listing, @comment]
    else
      flash[:alert] = "Comment has not been created."
      render "new"
    end
  end

  def show
  end



  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def set_comment
    @comment = @listing.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :tip)
  end
end