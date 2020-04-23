require "rails_helper"

RSpec.describe ResourceCategory, type: :model do
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

  describe "methods" do
    let(:resource_category) {ResourceCategory.new}

    it "can activate" do
        category = ResourceCategory.new
        category.activate
        expect(category.active).to be_truthy
    end

    it "can deactivate" do
        category = ResourceCategory.new
        category.deactivate
        expect(category.active).to be_falsey
    end

    it "determines inactivity" do
        category = resource_category
        category.activate
        expect(category.inactive?).to be_falsey
        category.deactivate
        expect(category.inactive?).to be_truthy
    end

    it "has a string representation" do
        category = resource_category
        category.name = "test"
        expect(category.name).to eq("test")
    end

  end
end
