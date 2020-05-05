require "rails_helper"

RSpec.describe Ticket, type: :model do
  let(:ticket) { build(:ticket) }

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
    it { should belong_to(:organization).optional }
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

  describe "scopes" do
    let(:open_ticket) { create(:ticket, closed: false) }
    let(:closed_ticket) { create(:ticket, closed: true) }
    let(:open_ticket_with_org) { create(:ticket, closed: false, organization: create(:organization)) }
    let(:closed_ticket_with_org) { create(:ticket, closed: true, organization: create(:organization)) }

    describe "::open" do
      it "will return all tickets that are not closed and have no organization" do
        expect(Ticket.open).to include open_ticket
        expect(Ticket.open).to_not include closed_ticket, open_ticket_with_org, closed_ticket_with_org
      end
    end

    describe "::closed" do
      it "will return all tickets that are closed" do
        expect(Ticket.closed).to include closed_ticket, closed_ticket_with_org
        expect(Ticket.closed).to_not include open_ticket, open_ticket_with_org
      end
    end

    describe "::all_organization" do
      it "will return all tickets that are open and have an organization" do
        expect(Ticket.all_organization).to include open_ticket_with_org
        expect(Ticket.all_organization).to_not include open_ticket, closed_ticket, closed_ticket_with_org
      end
    end

    describe "::organization" do
      it "will return open tickets that have a given organization id" do
        expect(Ticket.organization(open_ticket_with_org.organization_id)).to include open_ticket_with_org
        expect(Ticket.organization(open_ticket_with_org.organization_id)).to_not include open_ticket, closed_ticket, closed_ticket_with_org
      end
    end

    describe "::closed_organization" do
      it "will return closed tickets that have a given organization id" do
        expect(Ticket.closed_organization(closed_ticket_with_org.organization_id)).to include closed_ticket_with_org
        expect(Ticket.closed_organization(open_ticket_with_org.organization_id)).to_not include open_ticket, closed_ticket, open_ticket_with_org
      end
    end

    describe "::region" do 
      it "will return tickets that have a given region id" do
        expect(Ticket.region(open_ticket.region_id)).to include open_ticket
        expect(Ticket.region(open_ticket.region_id)).to_not include closed_ticket, open_ticket_with_org, closed_ticket_with_org
      end  
    end
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
