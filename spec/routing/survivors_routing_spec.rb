require_relative '../spec_helper'

RSpec.describe SurvivorsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/survivors").to route_to("survivors#index")
    end

    it "routes to #new" do
      expect(:get => "/survivors/new").to route_to("survivors#new")
    end

    it "routes to #show" do
      expect(:get => "/survivors/1").to route_to("survivors#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/survivors/1/edit").to route_to("survivors#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/survivors").to route_to("survivors#create")
    end

    it "routes to #update" do
      expect(:put => "/survivors/1").to route_to("survivors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/survivors/1").to route_to("survivors#destroy", :id => "1")
    end

  end
end
