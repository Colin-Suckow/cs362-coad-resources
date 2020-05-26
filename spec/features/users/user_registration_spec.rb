require "rails_helper"

RSpec.describe "User registration", type: :feature do
  context "as a unregistered user" do
    it "will respond with a prompt to confirm your email when values are valid" do
      visit signup_path
      fill_in "Email address", with: "fake@fake.com"
      fill_in "Password", with: "1234567"
      fill_in "Password confirmation", with: "1234567"
      click_on "commit"
      expect(page).to have_content("confirmation link")
    end

    it "will respond with an error message when values are invalid" do
      visit signup_path
      fill_in "Email address", with: "NOT VALID"
      fill_in "Password", with: "1234567"
      fill_in "Password confirmation", with: "1234567"
      click_on "commit"
      expect(page).to have_content("errors")
    end
  end
end
