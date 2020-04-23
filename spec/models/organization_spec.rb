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
    it { should validate_presence_of :email }    
    it { should validate_presence_of :name }
    it { should validate_presence_of :phone }
    it { should validate_presence_of :status }
    it { should validate_presence_of :primary_name }
    it { should validate_presence_of :secondary_name }
    it { should validate_presence_of :secondary_phone }
    it { should validate_length_of(:email).is_at_least(1).is_at_most(255).on(:create) } 
    it { should allow_value("vaild@email.com").for :email }   
    it { should_not allow_value("not vaild email").for :email }   
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_length_of(:name).is_at_least(1).is_at_most(255).on(:create) }
    it { should validate_uniqueness_of(:name).case_insensitive } 
    it { should validate_length_of(:description).is_at_most(1020).on(:create) }
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
