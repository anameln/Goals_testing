
RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    # be_bigger_than(2).and_smaller_than(4).description
    #   # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #   # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  def sign_up(username, password)
    visit('/users/new')
    fill_in('Username', with: username)
    fill_in('Password', with: password)
    click_button('Sign Up')
  end

  def sign_up_as_sennacy
    sign_up('Sennacy', 'catcatcat')
  end

  def sign_in(username, password)
    visit('/session/new')
    fill_in('Username', with: username)
    fill_in('Password', with: password)
    click_button('Sign In')
  end

  def sign_in_as_sennacy
    sign_in('Sennacy', 'catcatcat')
  end
  
  def sign_out
    click_button('Sign Out')
  end
end
