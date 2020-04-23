require 'rails_helper'

RSpec.describe Region, type: :model do
    
  let(:region) { Region.new(name: "FAKE")}

  describe "attributes" do 

    it "has a name" do 
      expect(region).to respond_to :name
    end

  end

  describe "associations" do 

    it "can have many tickets" do
      expect(region).to have_many :tickets
    end

  end

  describe "validations" do 

    it "validates presence of name" do
      expect(region).to validate_presence_of :name
    end

    it "validates the length of name" do
      expect(region).to validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create)
    end

    it "validates uniqueness of name" do 
      expect(region).to validate_uniqueness_of(:name).case_insensitive
    end

  end

  describe "#to_s" do

    it "returns a string" do 
      expect(region.to_s).to be_instance_of String
    end

    it "returns its name" do 
      expect(region.to_s).to eq "FAKE"
    end

  end

  describe "::unspecified" do 

    it "creates a Region with name 'Unspecified' if non exist" do
      expect(Region.where(name: 'Unspecified')).to be_empty
      expect{ Region.unspecified }.to change { Region.count }.by 1
    end

    it "dosen't create a new Region if a Region exists with name 'Unspecified'" do
      Region.create(name:'Unspecified')
      expect{ Region.unspecified }.to_not change { Region.count }
    end

    it "returns a Region with the name 'Unspecified'" do 
      expect(Region.unspecified.to_s).to eq 'Unspecified'
    end

  end

 


end
