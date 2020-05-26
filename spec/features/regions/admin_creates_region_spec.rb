require "rails_helper"

RSpec.describe "Creating a Region", type: :feature do
  context "as an admin" do
    before(:each) do
      admin = create(:user, role: "admin")
      admin.confirm
      log_in_as(admin)
    end

    it "adds region name to regions page when it is successfully created" do
      visit regions_path
      click_on "Add Region"
      fill_in "Name", with: "FAKE"
      click_on "Add Region"
      expect(page).to have_content("FAKE")
    end

    it "displays an error message when data provided is not valid" do
      visit regions_path
      click_on "Add Region"
      fill_in "Name", with: ""
      click_on "Add Region"
      expect(page).to have_content("error")
    end
  end
end
