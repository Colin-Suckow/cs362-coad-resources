require "rails_helper"

RSpec.describe "Deleting a Region", type: :feature do
  context "as an admin" do
    let(:region) { create(:region) }

    before(:each) do
      region
      admin = create(:user, role: "admin")
      admin.confirm
      log_in_as(admin)
    end

    it "will display a message that the region was deleted" do
      visit regions_path
      click_on region.name
      click_on "Delete"
      expect(page).to have_content("#{region.name} was deleted")
    end
  end
end
