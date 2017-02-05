require_relative '../spec_helper'

RSpec.describe "Create Survivor", :type => :model do
	context "missing" do
	  it "name" do
	  	survivor = Survivor.new(name:nil, age: 23, gender: "Male", lat: 3, long: 2, infected_reports: 0)
	  	survivor.save
	  	expect(survivor.new_record?).to eq(true)
	  end

	  it "age" do
	  	survivor = Survivor.new(name: "jack", age: nil, gender: "Male", lat: 3, long: 2, infected_reports: 0)
	  	survivor.save
	  	expect(survivor.new_record?).to eq(true)
	  end

	  it "gender" do
	  	survivor = Survivor.new(name: "jack", age: 23, gender: nil, lat: 3, long: 2, infected_reports: 0)
	  	survivor.save
	  	expect(survivor.new_record?).to eq(true)
	  end

	  it "lat" do
	  	survivor = Survivor.new(name: "jack", age: 23, gender: "Male", lat: nil, long: 2, infected_reports: 0)
	  	survivor.save
	  	expect(survivor.new_record?).to eq(true)
	  end

	  it "long" do
	  	survivor = Survivor.new(name: "jack", age: 23, gender: "Male", lat: 3, long: nil, infected_reports: 0)
	  	survivor.save
	  	expect(survivor.new_record?).to eq(true)
	  end
	end
end

RSpec.describe Survivor, :type => :model do
  it "is named Michonne" do
  	survivor = Survivor.new
  	survivor.name = 'Michonne'
  	expect(survivor.name).to eq('Michonne')
  end
end
