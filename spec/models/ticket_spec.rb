require 'rails_helper'

RSpec.describe Ticket, type: :model do

  describe "attributes" do 
    it { should respond_to :name }
    it { should respond_to :description }
    it { should respond_to :phone }
    it { should respond_to :organization_id}
    it { should respond_to :closed }
    it { should respond_to :closed_at }
    it { should respond_to :resource_category_id }
    it { should respond_to :region_id }
#     it { should respond_to :index_tickets_on_organization_id }
#     it { should respond_to :index_tickets_on_region_id }
#     it { should respond_to :index_tickets_on_resource_category_id } 
  end

  describe "associations" do 
    #todo
  end

  describe "validations" do 
    # todo
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
