class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save 
      flash[:notice] = "Listing has been created."
      redirect_to @listing
    else
      flash[:alert] = "Listing has not been created."

      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      flash[:notice] = "Listing has been updated."
      redirect_to @listing 
    else
      flash[:alert] = "Listing has not been updated."
      render "edit"
    end
  end

  def destroy
    @listing.destroy
    flash[:notice] = "Listing has been deleted."
    redirect_to listings_path
  end
  private

  def listing_params
    params.require(:listing).permit(:name, :description)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The listing you were looking for could not be found."
    redirect_to listings_path
  end
end