require "rails_helper"

RSpec.describe "Updating an Organization", type: :feature do
  context "as an organization user" do
    before(:each) do
      organization_user = create(:user, role: "organization", organization: create(:organization, status: :approved))
      organization_user.confirm
      log_in_as(organization_user)
    end

    it "doesn't do anything, it just displays the same page" do
      visit dashboard_path
      click_on "Edit Organization"
      fill_in "Name", with: "Fake2.0"
      fill_in "Phone", with: "5419876543"
      fill_in "Email", with: "1"
      fill_in "Description", with: "Fake2.0"
      click_on "Update Resource"
      expect(page).to have_content("Edit Organization")
    end
  end
end
