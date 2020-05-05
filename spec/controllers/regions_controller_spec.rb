require 'rails_helper'

RSpec.describe RegionsController, type: :controller do

    context "as an unsigned user" do
        let (:unsigned_in_user) { 
            User.create(role: "organization",email:"fake@fake.com",password:"vdfbhbshjfd") }
    #     describe "#index" do
    #         specify {expect(get(regions_path).to redirect_to(login_path))}
    #     end
    end

    context "as an organization" do
        
        let (:organization_user) { User.create(
            role: "organization",email:"fake@fake.com",password:"vdfbhbshjfd")}

        before do 
            sign_in(organization_user)
        end

        # describe "#index" do
        #     specify {expect(get(regions_path).to redirect_to(dashboard_path))}
        # end
    end

    context "as an admin" do 
    end

end
