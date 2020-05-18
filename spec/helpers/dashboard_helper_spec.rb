require "rails_helper"

# Specs in this file have access to a helper object that includes
# the DashboardHelper. For example:
#
# describe DashboardHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe DashboardHelper, type: :helper do
  let(:user) do
    user = double
    user.stub(:admin?).and_return(false)
    user.stub_chain(:organization, :submitted?).and_return(false)
    user.stub_chain(:organization, :approved?).and_return(false)
    user
  end

  describe "dashboard_for" do
    it "returns 'admin_dashboard' if admin? returns true" do
      user.stub(:admin?).and_return(true)
      expect(dashboard_for(user)).to eq("admin_dashboard")
    end

    it "returns 'organization_submitted_dashboard' if user isn't an admin and its organization is submitted" do
      user.stub_chain(:organization, :submitted?).and_return(true)
      expect(dashboard_for(user)).to eq("organization_submitted_dashboard")
    end

    it "returns 'organization_approved_dashboard' if user isn't an admin and its organization is approved" do
      user.stub_chain(:organization, :approved?).and_return(true)
      expect(dashboard_for(user)).to eq("organization_approved_dashboard")
    end

    it "returns 'create_application_dashboard' if user isn't an admin and its organization isn't submitted or approved" do
      expect(dashboard_for(user)).to eq("create_application_dashboard")
    end
  end
end
