require "rails_helper"

RSpec.describe OrganizationsController, type: :controller do
  let (:organization) { create(:organization) }

  context "as an unsigned user" do
    let (:unsigned_in_user) { create(:user) }

    describe "#index" do
      specify { expect(get(:index)).to redirect_to(new_user_session_path) }
    end

    describe "#new" do
      specify { expect(get(:new)).to redirect_to(new_user_session_path) }
    end

    describe "#create" do
      specify { expect(get(:create)).to redirect_to(new_user_session_path) }
    end

    describe "#update" do
      specify { expect(get(:update, params: { id: organization.id })).to redirect_to(new_user_session_path) }
    end

    describe "#approve" do
      specify { expect(get(:approve, params: { id: organization.id })).to redirect_to(new_user_session_path) }
    end

    describe "#reject" do
      specify { expect(get(:approve, params: { id: organization.id })).to redirect_to(new_user_session_path) }
    end
  end

end
