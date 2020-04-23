require 'rails_helper'

RSpec.describe ResourceCategory, type: :model do

    it "can have a name" do
        expect(ResourceCategory).to respond_to :name
    end

    it "can be active" do
        expect(ResourceCategory).to respond_to :active
    end

end
