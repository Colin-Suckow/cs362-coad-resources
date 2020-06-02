require "rails_helper"

RSpec.describe "Closing a ticket", type: :feature do
  context "as an organization" do
    let(:ticket) { create(:ticket) }
    let(:organization) { create(:organization, status: "approved") }

    before(:each) do
      organization
      ticket
      organization_user = create(:user, role: "organization")
      organization_user.confirm

      organization.users << organization_user

      TicketService.capture_ticket(ticket.id, organization_user)

      log_in_as(organization_user)
    end

    it "Closes a ticket" do
      visit dashboard_path
      click_on "Tickets"
      click_on ticket.name
      print page.html
      click_on "Close"

      expect(page).to have_content("Dashboard") #Check that the user was sent back to the dashboard
    end
  end
end
