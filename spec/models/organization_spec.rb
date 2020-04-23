require "rails_helper"

RSpec.describe Organization, type: :model do
  describe "attributes" do
    it { should respond_to :name }
    it { should respond_to :status }
    it { should respond_to :phone }
    it { should respond_to :email }
    it { should respond_to :description }
    it { should respond_to :rejection_reason }
    it { should respond_to :liability_insurance }
    it { should respond_to :primary_name }
    it { should respond_to :secondary_name }
    it { should respond_to :secondary_phone }
    it { should respond_to :title }
    it { should respond_to :transportation }
  end

  describe "associations" do
    it { should have_many :tickets }
    it { should have_many :users }
    it { should have_and_belong_to_many :resource_categories }
  end

  describe "validations" do
  end

  describe "#approve" do
  end

  describe "#reject" do
  end

  describe "#set_default_status" do
  end

  describe "#to_s" do
  end
end
