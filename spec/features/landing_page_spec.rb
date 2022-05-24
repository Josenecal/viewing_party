require 'rails_helper'

RSpec.describe "landing page" do
  it "displays the name of the application" do
    visit '/'

    expect(page).to have_content("Viewing Party Lite")
  end

  it "has a button to create a new user" do
    visit '/'

    expect(page).to_not have_content("Carl")
    expect(page).to have_button("Create New User")

    click_button "Create New User"
    fill_in "Name", with: "Carl"
    fill_in "Email", with: "carl@catmail.com"
    fill_in "Password", with: "pAsSwOrD"
    fill_in "Confirm Password", with: "pAsSwOrD"
    click_button "Submit"

    expect(current_path).to match(/\/users\/\d+\//)
    expect(page).to have_content("Carl")
  end

  it "has a list of existing users that link to their dashboards" do
    user_1 = User.create!(name: "Twitch", email: "twitch@dogmail.com", password: "test", password_confirmation: "test")
    user_2 = User.create!(name: "Riley", email: "riley@dogmail.com", password: "this_is_a_password", password_confirmation: "this_is_a_password")
    user_3 = User.create!(name: "Carl", email: "carl@catmail.com", password: "password", password_confirmation: "password")
    visit '/'

    expect(page).to have_content("Twitch")
    expect(page).to have_content("Riley")
    expect(page).to have_content("Carl")

    click_link "Riley"
    expect(current_path).to eq("/users/#{user_2.id}")
  end

  it "has a link to the landing page" do
    visit '/'

    expect(page).to have_link("Landing Page")
  end
end
