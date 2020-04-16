require 'rails_helper'

RSpec.describe Region, type: :model do
    # it "can be instantiated" do 
    #     expect(Region.new).to exist
    # end

    it "can have many tickets" do
        expect(Region.new).to have_many :tickets
    end

    it "can have a name" do 
        expect(Region.new).to respond_to :name
    end

    it "can be coverted to a string" do 
        region = Region.new
        region.name = "central oregon"
        expect(region.to_s).to be_instance_of String
    end

end
