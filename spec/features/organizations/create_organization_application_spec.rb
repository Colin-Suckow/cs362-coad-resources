require "rails_helper"

RSpec.describe "Creating an Organization Application", type: :feature do
  context "as an organization user" do
    before(:each) do
      create(:user, role: "admin")
      organization_user = create(:user, role: "organization")
      organization_user.confirm
      log_in_as(organization_user)
    end

    it "will display a message stating that the application was submitted when everthing is filled out correctly" do
      visit dashboard_path
      click_on "Create Application"
      choose "organization_liability_insurance_true"
      choose "organization_agreement_one_true"
      choose "organization_agreement_two_true"
      choose "organization_agreement_three_true"
      choose "organization_agreement_four_true"
      choose "organization_agreement_five_true"
      choose "organization_agreement_six_true"
      choose "organization_agreement_seven_true"
      choose "organization_agreement_eight_true"
      fill_in "What is your name? (Last, First)", with: "Fake Fake"
      fill_in "Organization Name", with: "Fake"
      fill_in "What is your title? (if applicable)", with: "Fake"
      fill_in "What is your direct phone number? Cell phone is best.", with: "5411234567"
      fill_in "Who may we contact regarding your organization's application if we are unable to reach you?", with: "Fake"
      fill_in "What is a good secondary phone number we may reach your organization at?", with: "5411234567"
      fill_in "What is your Organization's email?", with: "Fake@fake.com"
      fill_in "Description", with: "Fake"
      choose "organization_transportation_yes"
      click_on "Apply"
      expect(page).to have_content("Application Submitted")
    end

    it "will prompt the user with a message when items aren't filled in" do
      visit dashboard_path
      click_on "Create Application"
      click_on "Apply"
      expect(page).to have_content("can't be blank")
    end
  end
end
