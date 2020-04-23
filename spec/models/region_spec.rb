require 'rails_helper'

RSpec.describe Region, type: :model do

    it "has a name" do
        expect(Region).to respond_to(:name)
    end

    specify {is_expected.to respond_to(:created_at)}
    specify {is_expected.to respond_to(:updated_at)}

end
