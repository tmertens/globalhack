require "rails_helper"

RSpec.describe ClientsOrganizationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/clients_organizations").to route_to("clients_organizations#index")
    end

    it "routes to #new" do
      expect(:get => "/clients_organizations/new").to route_to("clients_organizations#new")
    end

    it "routes to #show" do
      expect(:get => "/clients_organizations/1").to route_to("clients_organizations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/clients_organizations/1/edit").to route_to("clients_organizations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/clients_organizations").to route_to("clients_organizations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/clients_organizations/1").to route_to("clients_organizations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/clients_organizations/1").to route_to("clients_organizations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/clients_organizations/1").to route_to("clients_organizations#destroy", :id => "1")
    end

  end
end
