require "rails_helper"

RSpec.describe "Rejecting an organization", type: :feature do
  context "as an admin" do
    let(:organization) { create(:organization) }

    before(:each) do
      organization
      admin = create(:user, role: "admin")
      admin.confirm
      log_in_as(admin)
    end

    it "displays a message indicating that the organization has been rejected" do
      visit organizations_path
      click_on organization.name
      click_on "Reject"
      expect(page).to have_content("#{organization.name} has been rejected")
    end
  end
end
