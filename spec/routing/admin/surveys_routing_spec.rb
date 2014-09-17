require "spec_helper"

describe Admin::SurveysController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/surveys").should route_to("admin/surveys#index")
    end

    it "routes to #new" do
      get("/admin/surveys/new").should route_to("admin/surveys#new")
    end

    it "routes to #show" do
      get("/admin/surveys/1").should route_to("admin/surveys#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/surveys/1/edit").should route_to("admin/surveys#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/surveys").should route_to("admin/surveys#create")
    end

    it "routes to #update" do
      put("/admin/surveys/1").should route_to("admin/surveys#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/surveys/1").should route_to("admin/surveys#destroy", :id => "1")
    end

  end
end
