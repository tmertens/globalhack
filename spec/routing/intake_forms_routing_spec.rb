require "rails_helper"

RSpec.describe IntakeFormsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/intake_forms").to route_to("intake_forms#index")
    end

    it "routes to #new" do
      expect(:get => "/intake_forms/new").to route_to("intake_forms#new")
    end

    it "routes to #show" do
      expect(:get => "/intake_forms/1").to route_to("intake_forms#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/intake_forms/1/edit").to route_to("intake_forms#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/intake_forms").to route_to("intake_forms#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/intake_forms/1").to route_to("intake_forms#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/intake_forms/1").to route_to("intake_forms#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/intake_forms/1").to route_to("intake_forms#destroy", :id => "1")
    end

  end
end
