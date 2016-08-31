require_relative '../spec_helper'


RSpec.describe Survivor, :type => :model do
  it "is named Michonne" do
  	survivor = Survivor.new
  	survivor.name = 'Michonne'
  	expect(survivor.name).to eq('Michonne')
  end
end
