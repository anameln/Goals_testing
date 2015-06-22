feature "user comments" do
  before :each do
    sign_up_as_sennacy
    fill_in 'Goal', with: 'Pass the rails assessment'
    choose('Public')
    click_button 'Add Goal'
    sign_out
  end


  it "can't comment unless signed in" do
    visit "/users/1"
    expect(page).not_to have_content "Add comment"
  end

  it "accepts comment if signed in" do
    sign_in_as_sennacy
    visit "/users/1"
    fill_in "Comment", with: "Hey it's me!"
    click_button "Add Comment"
    expect(page).to have_content "Hey it's me!"
  end
end

feature "goal comments" do
  before :each do
    sign_up_as_sennacy
    fill_in 'Goal', with: 'Pass the rails assessment'
    choose('Public')
    click_button 'Add Goal'
    sign_out
  end

  it "can't comment on goals unless signed in" do
    visit "/users/1"
    click_link('Pass the rails assessment')
    expect(page).to have_content "Sign In"
  end

  it "redirects to goal's page after making a comment" do
    sign_up("katrina", "hurricane")
    visit "/users/1"
    click_link('Pass the rails assessment')
    fill_in 'Comment', with: "Gonna study hard tonight!"
    click_button 'Add Comment'
    expect(page).to have_content "Gonna study hard tonight!"
    expect(page).to have_content "Pass the rails assessment"
    expect(page).to have_content "Sennacy"
  end

end
