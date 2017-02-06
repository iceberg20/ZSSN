require_relative '../spec_helper'

RSpec.describe TradeController, type: :controller do
	describe "#trade" do
    it "try trade with infected survivor" do
    	@survivor1 = Survivor.new(name:"jack", age: 23, gender: "Male", lat: 3, long: 2, infected_reports: 3)
  	  @survivor1.inventory = Inventory.create(water: 1, food: 1, medication: 1, ammunition: 1)
  	 	@survivor1.save
  	 	@survivor2 = Survivor.new(name:"jack", age: 23, gender: "Male", lat: 3, long: 2, infected_reports: 0)
  	  @survivor2.inventory = Inventory.create(water: 1, food: 1, medication: 1, ammunition: 1)
    	@survivor2.save

    	params = { "survivor_1": { "id": "1", "items": {"water": "1", "food": "1", "medication": "1", "ammunition": "1"}} , "survivor_2": { "id": "2", "items": {"water": "1", "food": "1", "medication": "1", "ammunition": "1"} }}
			post "trade", params, { format: 'json'}

			expect(response.body).to eq("invalid_trade")
		end

		it "try trade with not infected survivor" do
    	@survivor1 = Survivor.new(name:"jack", age: 23, gender: "Male", lat: 3, long: 2, infected_reports: 0)
  	  @survivor1.inventory = Inventory.create(water: 1, food: 1, medication: 1, ammunition: 1)
  	 	@survivor1.save
  	 	@survivor2 = Survivor.new(name:"jack", age: 23, gender: "Male", lat: 3, long: 2, infected_reports: 0)
  	  @survivor2.inventory = Inventory.create(water: 1, food: 1, medication: 1, ammunition: 1)
    	@survivor2.save

    	params = { "survivor_1": { "id": "1", "items": {"water": "1", "food": "1", "medication": "1", "ammunition": "1"}} , "survivor_2": { "id": "2", "items": {"water": "1", "food": "1", "medication": "1", "ammunition": "1"} }}
			post "trade", params, { format: 'json'}

			expect(response.body).to eq("trade made successfully!")
		end
	end
end
