class ListingsController < ApplicationController
  def index
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
    @listing = Listing.find(params[:id])
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :description)
  end
end