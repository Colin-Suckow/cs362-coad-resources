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
      specify { expect(get(:reject, params: { id: organization.id })).to redirect_to(new_user_session_path) }
    end
  end

  context "as an organization" do
    let (:organization_user) { create(:user, role: "organization") }
    let (:admin_user) { create(:user, role: "admin") }

    before(:each) do
      organization_user.confirm
      admin_user.confirm
      sign_in(organization_user)
    end

    describe "#index" do
      specify { expect(get(:index)).to be_successful }
    end

    describe "#new" do
      specify { expect(get(:new)).to be_successful }
    end

    describe "#create" do
      specify { expect(get(:create, params: { organization: attributes_for(:organization) })).to redirect_to(organization_application_submitted_path) }
    end

    describe "#update" do
      specify { expect(get(:update, params: { id: organization.id })).to redirect_to(dashboard_path) }
    end

    describe "#approve" do
      specify { expect(get(:approve, params: { id: organization.id })).to redirect_to(dashboard_path) }
    end

    describe "#reject" do
      specify { expect(get(:reject, params: { id: organization.id })).to redirect_to(dashboard_path) }
    end
  end

  context "as an admin" do
    let (:admin_user) { create(:user, role: "admin") }

    before(:each) do
      admin_user.confirm
      sign_in(admin_user)
    end

    describe "#index" do
      specify { expect(get(:index)).to be_successful }
    end

    describe "#new" do
      specify { expect(get(:new)).to_not be_successful }
    end

    describe "#create" do
      specify { expect(get(:create, params: { organization: attributes_for(:organization) })).to redirect_to(dashboard_path) }
    end

    describe "#update" do
      specify { expect(get(:update, params: { id: organization.id })).to redirect_to(dashboard_path) }
    end

    describe "#approve" do
      specify { expect(get(:approve, params: { id: organization.id })).to redirect_to(organizations_path) }
    end

    describe "#reject" do
      specify { expect(get(:reject, params: { organization: attributes_for(:organization), id: organization.id })).to redirect_to(organizations_path) }
    end
  end
end
