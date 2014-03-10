require 'spec_helper'

describe ListingsController do 
  it "displays an error for a missing listing" do 
    get :show, id: "not-here"
    expect(response).to redirect_to(listings_path)
    message = "The listing you were looking for could not be found."
    expect(flash[:alert]).to eql(message)
  end

end