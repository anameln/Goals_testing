require 'rails_helper'

feature "create new goals" do
  before :each do
    sign_up_as_sennacy
    fill_in 'Goal', with: 'Pass the rails assessment'
    choose('Public')
    click_button 'Add Goal'
  end

  it "shows the goal show page on submit" do
    expect(page).to have_content "Pass the rails assessment"
  end

  it "should have status uncompleted" do
    expect(page).to have_content "status: not yet completed"
  end
end

feature "complete goals" do
  before :each do
    sign_up_as_sennacy
    fill_in 'Goal', with: 'Pass the rails assessment'
    choose('Public')
    click_button 'Add Goal'
  end

  it "allows you to complete goals"
