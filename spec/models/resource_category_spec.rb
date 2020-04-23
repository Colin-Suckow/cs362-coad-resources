require "rails_helper"

RSpec.describe ResourceCategory, type: :model do
  let(:resource_category) { ResourceCategory.new(name: "FAKE") }

  describe "attributes" do
    it { should respond_to :name }
    it { should respond_to :active }
  end

  describe "validators" do
    it { should validate_presence_of :name }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe "associations" do
    it { should have_many :tickets }
    it { should have_and_belong_to_many :organizations }
  end

  describe "::unspecified" do
    it "creates a ResourceCategory with name 'Unspecified' if non exist" do
      expect(ResourceCategory.where(name: "Unspecified")).to be_empty
      expect { ResourceCategory.unspecified }.to change { ResourceCategory.count }.by 1
    end

    it "dosen't create a new ResourceCategory if a ResourceCategory exists with name 'Unspecified'" do
      ResourceCategory.create(name: "Unspecified")
      expect { ResourceCategory.unspecified }.to_not change { ResourceCategory.count }
    end

    it "returns a ResourceCategory with the name 'Unspecified'" do
      expect(ResourceCategory.unspecified.to_s).to eq "Unspecified"
    end
  end

  describe "#activate" do
    it "can activate" do
      category = ResourceCategory.new
      category.activate
      expect(category.active).to be_truthy
    end
  end

  describe "#deactivate" do
    it "can deactivate" do
      category = ResourceCategory.new
      category.deactivate
      expect(category.active).to be_falsey
    end
  end

  describe "#inactive?" do
    it "returns false if active" do
      category = resource_category
      category.activate
      expect(category.inactive?).to be_falsey
    end

    it "returns true if inactive" do
      category = resource_category
      category.deactivate
      expect(category.inactive?).to be_truthy
    end
  end

  describe "#to_s" do
    it "returns a string" do
      expect(resource_category.to_s).to be_instance_of String
    end

    it "returns its name" do
      expect(resource_category.to_s).to eq "FAKE"
    end
  end
end
