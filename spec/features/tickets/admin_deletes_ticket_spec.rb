require "rails_helper"

RSpec.describe "Deleting a Ticket", type: :feature do
  context "as an admin" do
    let(:ticket) { create(:ticket) }

    before(:each) do
      ticket
      admin = create(:user, role: "admin")
      admin.confirm
      log_in_as(admin)
    end

    it "will tell the user that the ticket was deleted" do
      visit dashboard_path
      click_on ticket.name
      click_on "Delete"
      expect(page).to have_content("Ticket #{ticket.id} was deleted")
    end
  end
end
