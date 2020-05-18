require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "full_title" do
    it "returns 'Disaster Resource Network' if argument is empty" do
      expect(full_title).to eq("Disaster Resource Network")
    end

    it "returns the argument plus ' | Disaster Resource Network' if agument is provided" do
      expect(full_title("FAKE")).to eq("FAKE | Disaster Resource Network")
    end
  end
end
