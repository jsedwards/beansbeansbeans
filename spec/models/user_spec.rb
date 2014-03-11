require 'spec_helper'

describe User do 
  describe "passwords" do 
    it "needs a password and confirmation to save" do 
      u = User.new(name: "Jeff")
      u.save 

      expect(u).to_not be_valid 
      
      u.password= "secret"
      u.password_confirmation = ""
      u.save
      expect(u).to_not be_valid

      u.password_confirmation = "secret"
      u.save
      expect(u).to be_valid
    end

    it "needs password and confirmation to match" do 
      u = User.create(
          name: "Jeff",
          password: "secret",
          password_confirmation: "supersecret")
      expect(u).to_not be_valid
    end
  end

  describe "authentication" do 
    let(:user) {User.create(name: "Jeff", password: "topsecret", password_confirmation: "topsecret")}

    it "authenticates with a correct password" do 
      expect(user.authenticate("topsecret")).to be 
    end

    it "does not authenticate with an incorrect password" do 
      expect(user.authenticate("notsotopsecret")).to_not be 
    end
  end
end