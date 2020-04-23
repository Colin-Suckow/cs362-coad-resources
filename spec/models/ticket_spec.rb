require "rails_helper"

RSpec.describe Ticket, type: :model do
  let(:ticket) { Ticket.new() }

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
    it { should allow_value("+61 412 345 678").for :phone }
    it { should_not allow_value("not a phone number").for :phone }
  end

  describe "#open?" do
    it "should be open when it is not closed" do
      expect(ticket.open?).to_not eq ticket.closed
    end
  end

  describe "#captured?" do
    it "should not be captured when it doesn't belong to an orginzation" do
      expect(ticket.captured?).to be_falsy
    end

    it "should be captured when it belongs to an orginzation" do
      Organization.new.tickets = [ticket]
      expect(ticket.captured?).to be_truthy
    end
  end

  describe "#to_s" do
    it "should return a string of the word ticket and its id" do
      expect(ticket.to_s).to eq "Ticket #{ticket.id}"
    end
  end
end
