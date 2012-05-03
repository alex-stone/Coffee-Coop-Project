require "spec_helper"

describe CooperativesController do
  describe "routing" do

    it "routes to #index" do
      get("/cooperatives").should route_to("cooperatives#index")
    end

    it "routes to #new" do
      get("/cooperatives/new").should route_to("cooperatives#new")
    end

    it "routes to #show" do
      get("/cooperatives/1").should route_to("cooperatives#show", :id => "1")
    end

    it "routes to #edit" do
      get("/cooperatives/1/edit").should route_to("cooperatives#edit", :id => "1")
    end

    it "routes to #create" do
      post("/cooperatives").should route_to("cooperatives#create")
    end

    it "routes to #update" do
      put("/cooperatives/1").should route_to("cooperatives#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/cooperatives/1").should route_to("cooperatives#destroy", :id => "1")
    end

  end
end
