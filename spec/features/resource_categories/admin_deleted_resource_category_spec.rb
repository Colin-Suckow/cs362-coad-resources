require "rails_helper"

RSpec.describe "Deleting a Resource Category", type: :feature do
  context "as an admin" do
    let(:resource_category) { create(:resource_category) }

    before(:each) do
      resource_category
      admin = create(:user, role: "admin")
      admin.confirm
      log_in_as(admin)
    end

    it "will tell the user that the category was deleted" do
      visit resource_categories_path
      click_on resource_category.name
      click_on "Delete"
      expect(page).to have_content("#{resource_category.name} was deleted")
    end
  end
end
