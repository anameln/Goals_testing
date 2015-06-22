require 'rails_helper'

feature "create new goals" do
  before :each do
    sign_up_as_sennacy
    visit 'goals/new'
  end

  it "shows the goal show page on submit" do
    fill_in 'Goal', with 'Pass the rails assessment'
    choose('Public')
    click_button 'Add Goal'
    expect(page).to have_content "Pass the rails assessment"
  end


end
