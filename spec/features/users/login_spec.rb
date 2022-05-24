require 'rails_helper'

RSpec.describe "user login" do

  it "presents a user with a log in form" do
    user = User.create!(name: "Bob", email: "Bob@rossproductions.com", password: "happylittletree")

    visit "/login"

    fill_in :email
  end

end
