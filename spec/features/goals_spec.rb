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

  it "allows you to complete goals" do
    click_button 'Completed'
    expect(page).to have_content "status: completed"
  end
end


feature "goal privacy" do
  before :each do
  sign_up_as_sennacy
  fill_in 'Goal', with: 'Gain 40 lbs'
  choose('Private')
  click_button 'Add Goal'
  fill_in 'Goal', with: 'Pass the rails assessment'
  choose('Public')
  click_button 'Add Goal'
  sign_out
  sign_up("katrina","hurricane")
  visit '/users/1'
  end

  it "shows other users' public goals" do
    expect(page).to have_content 'Pass the rails assessment'
  end

  it "hides other users' private goals" do
    expect(page).not_to have_content 'Gain 40 lbs'
  end


end
