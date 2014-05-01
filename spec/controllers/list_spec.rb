require 'spec_helper'

describe ListsController, "Creating/Showing a List for Current User" do
  describe "#index" do 
    before :each do
      #create a user that is logged in 
    end

    it "returns true that the index view was shown because user is new" do
      # do test with logged in user
    end
    it "returns false that the show view was shoen because the user is new" do
      # do test with user that is not loggeg in
    end
  end 


end
