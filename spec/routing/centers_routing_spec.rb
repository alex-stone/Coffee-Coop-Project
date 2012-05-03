require "spec_helper"

describe CentersController do
  describe "routing" do

    it "routes to #index" do
      get("/centers").should route_to("centers#index")
    end

    it "routes to #new" do
      get("/centers/new").should route_to("centers#new")
    end

    it "routes to #show" do
      get("/centers/1").should route_to("centers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/centers/1/edit").should route_to("centers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/centers").should route_to("centers#create")
    end

    it "routes to #update" do
      put("/centers/1").should route_to("centers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/centers/1").should route_to("centers#destroy", :id => "1")
    end

  end
end
