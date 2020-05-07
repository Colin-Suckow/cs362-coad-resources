require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe "attributes" do
    it { should respond_to :email }
    it { should respond_to :encrypted_password }
    it { should respond_to :reset_password_token }
    it { should respond_to :reset_password_sent_at }
    it { should respond_to :confirmation_token }
    it { should respond_to :confirmed_at }
    it { should respond_to :confirmation_sent_at }
    it { should respond_to :unconfirmed_email }
    it { should respond_to :role }
    it { should respond_to :organization_id }
  end

  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_length_of(:email).is_at_least(1).is_at_most(255) }
    it { should allow_value("test_email@suckow.dev").for :email }
    it { should_not allow_value("invalid_email").for :email }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of :password }
    it { should validate_length_of(:password).is_at_least(7).is_at_most(255) }
  end

  describe "#set_default_role" do
    it "sets role to :organization" do
      user.role = nil
      expect { user.set_default_role }.to change { user.role }.to "organization"
    end

    it "does not change existing role" do
      user.role = :admin
      expect { user.set_default_role }.not_to change { user.role }
    end
  end

  describe "#to_s" do
    describe "#to_s" do
      it "returns a string" do
        expect(user.to_s).to be_instance_of String
      end

      it "returns its email" do
        expect(build(:user, email: "test_email@suckow.dev").to_s).to eq "test_email@suckow.dev"
      end
    end
  end
end
