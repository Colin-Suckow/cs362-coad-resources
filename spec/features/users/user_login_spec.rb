require "rails_helper"

RSpec.describe "Logging in", type: :feature do
  context "as an organization user" do
    let(:organization_user) { create(:user, role: "organization") }
    context "that is confirmed" do
      before (:each) { organization_user.confirm }

      it "will display the organization dashbord when the user sucessuflly logs in" do
        visit login_path
        fill_in "user_email", with: organization_user.email
        fill_in "user_password", with: organization_user.password
        click_on "commit"
        expect(page).to have_content("Dashboard")
      end

      it "will tell the user that the login is invalid when the user logs in with an invalid value" do
        visit login_path
        fill_in "user_email", with: organization_user.email
        fill_in "user_password", with: "invalid password"
        click_on "commit"
        expect(page).to have_content("Invalid")
      end
    end
    context "that is unconfired" do
      it "will tell the user they aren't confirmed" do
        visit login_path
        fill_in "user_email", with: organization_user.email
        fill_in "user_password", with: organization_user.password
        click_on "commit"
        expect(page).to have_content("confirm")
      end
    end
  end

  context "as an admin" do 
    let(:admin) { create(:user, role: "admin") }
    before (:each) { admin.confirm }

    it "will display the admin dashbord" do 
      visit login_path
      fill_in "user_email", with: admin.email
      fill_in "user_password", with: admin.password
      click_on "commit"
      expect(page).to have_content("Dashboard")
    end
  end
end
