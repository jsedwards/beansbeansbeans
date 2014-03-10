class ListingsController < ApplicationController
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
    @listing = Listing.find(params[:id])
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(listing_params)
      flash[:notice] = "Listing has been updated."
      redirect_to @listing 
    else
      flash[:alert] = "Listing has not been updated."
      render "edit"
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    flash[:notice] = "Listing has been deleted."
    redirect_to listings_path
  end
  private

  def listing_params
    params.require(:listing).permit(:name, :description)
  end
end