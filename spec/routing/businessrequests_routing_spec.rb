require "spec_helper"

describe BusinessrequestsController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/businessrequests").to route_to("businessrequests#index")
    end

    it "routes to #new" do
      expect(:get => "/businessrequests/new").to route_to("businessrequests#new")
    end

    it "routes to #show" do
      expect(:get => "/businessrequests/1").to route_to("businessrequests#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/businessrequests/1/edit").to route_to("businessrequests#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/businessrequests").to route_to("businessrequests#create")
    end

    it "routes to #update" do
      expect(:put => "/businessrequests/1").to route_to("businessrequests#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/businessrequests/1").to route_to("businessrequests#destroy", :id => "1")
    end

  end
end
