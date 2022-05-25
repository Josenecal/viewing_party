require 'rails_helper'

RSpec.describe "landing page" do
  it "displays the name of the application" do
    visit '/'

    expect(page).to have_content("Viewing Party Lite")
  end

  it "has a button to create a new user" do
    visit '/'

    expect(page).to_not have_content("Carl")
    expect(page).to have_button("Create An Account")

    click_button "Create An Account"
    fill_in "Name", with: "Carl"
    fill_in "Email", with: "carl@catmail.com"
    fill_in :password, with: "pAsSwOrD"
    fill_in "Password Confirmation", with: "pAsSwOrD"
    click_button "Submit"

    expect(current_path).to eq "/dashboard"
    expect(page).to have_content("Carl")
  end

  it "has a button to login" do
    user_1 = User.create!(name: "Twitch", email: "twitch@dogmail.com", password: "test", password_confirmation: "test")
    user_2 = User.create!(name: "Riley", email: "riley@dogmail.com", password: "this_is_a_password", password_confirmation: "this_is_a_password")
    user_3 = User.create!(name: "Carl", email: "carl@catmail.com", password: "password", password_confirmation: "password")
    visit '/'

    click_on "Login"

    fill_in :email, with: user_1.email
    fill_in :password, with: user_1.password
    click_on "Login"

    expect(page).to have_content("Twitch")
    expect(page).not_to have_content("Riley")
    expect(page).not_to have_content("Carl")

  end

  it "has a link to the landing page" do
    visit '/'

    expect(page).to have_link("Landing Page")
  end

  it "shows buttons to dashboard and to logout if user is logged in" do
    user_1 = User.create!(name: "Twitch", email: "twitch@dogmail.com", password: "test", password_confirmation: "test")
    visit '/'
    expect(page).not_to have_button "My Dashboard"
    expect(page).not_to have_button "Logout"
    expect(page).to have_button "Create An Account"
    click_on "Login"

    fill_in :email, with: user_1.email
    fill_in :password, with: user_1.password
    click_on "Login"

    visit "/"
    expect(page).to have_button "My Dashboard"
    expect(page).to have_button "Logout"
    expect(page).not_to have_button "Create An Account"
    expect(page).not_to have_button "Login"
  end

  it "button to logout loggs user out" do
    user_1 = User.create!(name: "Twitch", email: "twitch@dogmail.com", password: "test", password_confirmation: "test")
    visit '/login'
    fill_in :email, with: user_1.email
    fill_in :password, with: user_1.password
    click_on "Login"
    visit '/'
    click_on "Logout"

    expect(page).to have_button "Login"
    expect(page).to have_button "Create An Account"
  end
end
