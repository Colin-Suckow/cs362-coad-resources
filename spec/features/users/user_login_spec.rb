require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do

    context "as an organization user" do
        let(:organization_user){create(:user, email:"FAKE@fake.com",password: "123456789",role: "organization")}

        before (:each) {organization_user.confirm}

        it "user sucessuflly logs in and sees organization dashbord" do 
            visit login_path
            fill_in "user_email", with: organization_user.email
            fill_in "user_password", with: organization_user.password 
            click_on "commit"
            expect(page).to have_content("Dashboard")
        end

    end

end
