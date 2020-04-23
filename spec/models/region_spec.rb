require 'rails_helper'

RSpec.describe Region, type: :model do

    specify {is_expected.to respond_to(:name)}
    specify {is_expected.to respond_to(:created_at)}
    specify {is_expected.to respond_to(:updated_at)}

end
