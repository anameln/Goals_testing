require 'spec_helper'
require 'rails_helper'

feature "the signup process" do
  before :each do
    visit "/users/new"
  end

  it "has a new user page" do
    expect(page).to have_content "Sign Up"
  end

  feature "signing up a user" do

    it "shows username on the homepage after signup" do
      sign_up_as_sennacy
      expect(page).to have_content "Sennacy"
    end
  end

end

feature "logging in" do
  before :each do
    sign_up_as_sennacy
    sign_out
  end
  it "shows username on the homepage after login" do
    sign_in_as_sennacy
    expect(page).to have_content "Sennacy"
  end

end

feature "logging out" do
  before :each do
    sign_up_as_sennacy
    sign_out
    visit "/session/new"
  end

  it "begins with logged out state" do
    expect(page).to have_content "Sign In"
    expect(page).not_to have_content "Sign Out"
  end

  it "doesn't show username on the homepage after logout" do
    sign_in_as_sennacy
    sign_out
    expect(page).not_to have_content "Sennacy"
  end


end
