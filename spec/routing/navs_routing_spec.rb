require "spec_helper"

describe NavsController do
  describe "routing" do

    it "routes to #index" do
      get("/navs").should route_to("navs#index")
    end

    it "routes to #new" do
      get("/navs/new").should route_to("navs#new")
    end

    it "routes to #show" do
      get("/navs/1").should route_to("navs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/navs/1/edit").should route_to("navs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/navs").should route_to("navs#create")
    end

    it "routes to #update" do
      put("/navs/1").should route_to("navs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/navs/1").should route_to("navs#destroy", :id => "1")
    end

  end
end
