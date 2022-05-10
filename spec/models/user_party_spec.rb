require 'rails_helper'

RSpec.describe User, type: :model do
  describe "relationships" do
    it should { belong_to(:user) }
    it should { belong_to(:party) }
  end
end