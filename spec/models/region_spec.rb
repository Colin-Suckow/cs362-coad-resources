require 'rails_helper'

RSpec.describe Region, type: :model do
    
  let(:region) { Region.new(name: "FAKE")}

  describe "associations" do 

    it "can have many tickets" do
      expect(region).to have_many :tickets
    end

  end
    
  describe "attributes" do 

    it "can have a name" do 
      expect(region).to respond_to :name
    end

  end

  describe "to_s" do

    it "returns a string" do 
      expect(region.to_s).to be_instance_of String
    end

    it "returns its name" do 
      expect(region.to_s).to eq "FAKE"
    end

  end


end
