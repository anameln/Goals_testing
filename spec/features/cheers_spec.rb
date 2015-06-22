feature "cheers" do
  before :each do
    sign_up_as_sennacy
    fill_in 'Goal', with: 'Pass the rails assessment'
    choose('Public')
    click_button 'Add Goal'
    sign_out
    sign_up("katrina", "hurricane")
    visit "/users/1"
  end

  it "lets you cheer a goal" do
    click_button 'Cheer'
    expect(page).to have_content "1 cheer(s)"
  end

  it "won't allow cheering the same goal twice" do
    click_button 'Cheer'
    expect(page).not_to have_button 'Cheer'
  end

  it "won't allow more than 5 cheers a day" do
    sign_out
    sign_in_as_sennacy
    5.times { make_goal }
    sign_out
    sign_in("katrina", "hurricane")
    visit "/users/1"
    6.times do { click_button 'Cheer' }
    expect(page).to have_content "Out of cheers. Pay to cheer more."
  end

  it "adds multiple cheers" do
    click_button 'Cheer'
    sign_out
    sign_in_as_sennacy
    click_button 'Cheer'
    expect(page).to have_content "2 cheer(s)"
  end

end
