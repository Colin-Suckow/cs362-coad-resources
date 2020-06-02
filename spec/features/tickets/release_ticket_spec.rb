require "rails_helper"

RSpec.describe "Releasing a ticket by an", type: :feature do
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

    it "Releases a ticket" do
      visit dashboard_path
      click_on "Tickets"
      click_on ticket.name
      click_on "Release"
      expect(page).to have_content("Dashboard") #Check that the user was sent back to the dashboard
    end
  end
end
