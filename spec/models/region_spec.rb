require "rails_helper"

RSpec.describe Region, type: :model do
  let(:region) { build(:region) }

  describe "attributes" do
    it { should respond_to :name }
  end

  describe "associations" do
    it { should have_many :tickets }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe "#to_s" do
    it "returns a string" do
      expect(region.to_s).to be_instance_of String
    end
  end

  describe "::unspecified" do
    it "creates a Region with name 'Unspecified' if non exist" do
      expect(Region.where(name: "Unspecified")).to be_empty
      expect { Region.unspecified }.to change { Region.count }.by 1
    end

    it "dosen't create a new Region if a Region exists with name 'Unspecified'" do
      Region.create(name: "Unspecified")
      expect { Region.unspecified }.to_not change { Region.count }
    end

    it "returns a Region with the name 'Unspecified'" do
      expect(Region.unspecified.to_s).to eq "Unspecified"
    end
  end
end
