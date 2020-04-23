require "rails_helper"

RSpec.describe User, type: :model do
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
end
