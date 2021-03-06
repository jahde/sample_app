include ApplicationHelper

def sign_in(user, options={})
  if options[:no_capybara]
    # Sign in when not using Capybara as well.
    remember_token = User.new_remember_token
    cookies[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.digest(remember_token))
  else
    visit signin_path
    fill_in "Email",        with: user.email
    fill_in "Password",     with: user.password
    click_button "Sign in"
  end
end

def sign_out
  click_link "Sign out"
end

def valid_signin(user)
  fill_in "Email",        with: user.email
  fill_in "Password",     with: user.password
  click_button "Sign in"
  # SIgn in when not using capybara as well.
  cookies[:remember_token] = user.remember_token
end

def valid_signup(user)
  #fill_in "Name",            with: "Example User"
  #fill_in "Email",           with: "user@example.com"
  #fill_in "Password",        with: "foobar"
  #fill_in "Confirmation",    with: "foobar"
  fill_in "Name",             with: user.name
  fill_in "Email",            with: user.email
  fill_in "Password",         with: user.password
  fill_in "Confirm Password", with: user.password
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    expect(page).to have_selector('div.alert.alert-error', text:message)
  end
end
