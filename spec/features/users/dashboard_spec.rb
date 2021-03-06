require 'rails_helper'

RSpec.describe "user dashboard" do

  before :each do
    @user_1 = User.create!(name: "Twitch", email: "twitch@dogmail.com", password: "password", password_confirmation: "password")
    visit "/login"
    fill_in :email, with: @user_1.email
    fill_in :password, with: @user_1.password
    click_on "Login"
  end

  it "has a button to discover movies" do

    expect(current_path).to eq "/dashboard"
    click_button "Discover Movies"

    expect(current_path).to eq("/discover")
  end

  it "shows a user's name at the top of the page" do
    within('#user_dashboard_heading') do
      expect(page).to have_content @user_1.name
    end
  end

  it "lists a user's parties in their own section" do
    party1 = Party.create!(host_id: @user_1.id, duration: 1, date: Time.parse("2022.04.23 16:30"), movie_id: 524)
    party2 = Party.create!(host_id: @user_1.id, duration: 15, date: Time.parse("2022.04.25 15:00"), movie_id: 740)
    visit "/dashboard"

    within("##{@user_1.id}_viewing_parties") do
      expect(page).to have_content(party1.date.strftime("%a, %b %e %Y"))
      expect(page).to have_content(party2.date.strftime("%a, %b %e %Y"))
    end

  end
end
