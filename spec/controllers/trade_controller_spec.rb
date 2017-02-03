require_relative '../spec_helper'

RSpec.describe TradeController, type: :controller do
	describe "GET value" do
    it "has a 200 status code" do
			get :value, {item: 'food'}
			expect(response.status).to eq(200)
		end
	end
end
