require "rails_helper"

RSpec.describe TicketsController, type: :controller do
  let (:ticket) { create(:ticket) }

  context "as an unsigned user" do
    let (:unsigned_in_user) { create(:user) }

    before(:each) { sign_in(unsigned_in_user) }

    describe "#new" do
      specify { expect(get(:new)).to be_successful }
    end

    describe "#create" do
      specify { expect(get(:create, params: { ticket: attributes_for(:ticket) })).to be_successful }
    end

    describe "#show" do
      specify { expect(get(:show, params: { id: ticket.id })).to redirect_to(new_user_session_path) }
    end

    describe "#capture" do
      specify { expect(get(:capture, params: { id: ticket.id })).to redirect_to(new_user_session_path) }
    end

    describe "#release" do
      specify { expect(get(:release, params: { id: ticket.id })).to redirect_to(new_user_session_path) }
    end

    describe "#close" do
      specify { expect(get(:close, params: { id: ticket.id })).to redirect_to(new_user_session_path) }
    end

    describe "#destroy" do
      specify { expect(get(:destroy, params: { id: ticket.id })).to redirect_to(new_user_session_path) }
    end
  end
end
