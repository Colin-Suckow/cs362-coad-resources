require "rails_helper"

RSpec.describe Ticket, type: :model do
  describe "attributes" do
    it { should respond_to :name }
    it { should respond_to :description }
    it { should respond_to :phone }
    it { should respond_to :organization_id }
    it { should respond_to :closed }
    it { should respond_to :closed_at }
    it { should respond_to :resource_category_id }
    it { should respond_to :region_id }
  end

  describe "associations" do
    it { should belong_to :region }
    it { should belong_to :resource_category }
    it { should belong_to :organization } #todo: look into optional test
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :phone }
    it { should validate_presence_of :region_id }
    it { should validate_presence_of :resource_category_id }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
    it { should validate_length_of(:description).is_at_most(1020).on(:create) }
    it { should allow_value("+61 412 345 678").for :phone}
    it { should_not allow_value("not a phone number").for :phone }
  end

  describe "scope" do
    # todo
  end

  describe "#open?" do
    #todo
  end

  describe "#captured?" do
    # todo
  end

  describe "#to_s" do
    # tod
  end
end
