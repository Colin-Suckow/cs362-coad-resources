require 'rails_helper'

RSpec.describe 'Creating a Ticket', type: :feature do
    let(:region) { create(:region) }
    let(:resource_category) { create(:resource_category) }

    before(:each) do
      resource_category
      region
    end


    context "as an unsigned in user" do
       
        it "Shows the user their ticket was submitted" do
          visit root_path
          click_on "Get Help"
          fill_in "Full Name", with: "FAKE FAKE"
          fill_in "Phone Number", with: "5411234567"
          select region.name, from: "Region"
          select resource_category.name, from: "Resource Category"
          fill_in "Description", with: "FAKE"
          click_on "Send this help request"
    
          expect(page).to have_content("Ticket Submitted")
        end
      end
end
