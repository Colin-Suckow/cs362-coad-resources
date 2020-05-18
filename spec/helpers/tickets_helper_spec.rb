require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TIcketsHelper. For example:
#
# describe TIcketsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TicketsHelper, type: :helper do

    describe "format_phone_number" do 
        it "adds US country code to the phone number and removes number seperaters" do 
            expect(format_phone_number("541-123-4567")).to eq("+15411234567")
        end
        it "returns nil if the number is not valid" do 
            expect(format_phone_number("bad number")).to be_nil
        end
    end
end
