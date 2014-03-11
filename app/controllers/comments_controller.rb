class CommentsController < ApplicationController
  before_action :require_signin!, excecpt: [:show, :index]
  before_action :set_listing
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def new
    @comment = @listing.comments.build
  end

  def create
    @comment = @listing.comments.build(comment_params)
    @comment.user = current_user
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

  def edit
  end

  def update
    if @comment.update(comment_params)
      flash[:notice] = "Comment has been updated."
      redirect_to [@listing, @comment]
    else
      flash[:alert] = "Comment has not been updated."
      render action: "edit"
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = "Comment has been deleted."
    redirect_to @listing 
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