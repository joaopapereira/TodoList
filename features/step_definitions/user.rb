require 'faker'

FactoryGirl.define do
  factory :user do
    username  'my_test_user'
    email 'test@domain.us'
    password 'asdf'
    password_confirmation 'asdf'
  end
end

Given "I am not logged in" do
  step %(I am on the homepage)
  begin 
    if find_field("Logout").value.should == content
      step %(I follow "Logout")
    end
  rescue Capybara::ElementNotFound
  end
  
  
end

Given(/^I am logged in as "(.*?)" and password "(.*?)"$/)do |email, password|
  step %(I am on the homepage)
  step %(I fill in "Email" with "#{email}")
  step %(I fill in "Password" with "#{password}")
  step %(I press "Sign in")
end

Then /^I go to user registration page/ do
    step %(I press "Register")
end
And /^I fill registration form with name "([^'\"]+)" email "([^'\"]+)" and password "([^'\"])+"/ do | name,  email, password|
  step %(I fill in "Username" with "#{name}")
  
  step %(I fill in "user_email" with "#{email}")
  step %(I fill in "user_password" with "#{password}")
  step %(I fill in "Password confirmation" with "#{password}")
  step %(I press "Sign in")
end

Given /the following user exists:$/ do |all_users|
  all_users.hashes.each do |attrs|
    if attrs.has_key? 'password'
      if not attrs.has_key? 'password_confirmation'
        attrs['password_confirmation'] = attrs['password']
      end
      
    end
    
    puts attrs
    FactoryGirl.create(:user, attrs)
  end
end

Then /^I see the message of successfull user registration$/ do
  expect(page).to have_content("created correctly")
end

And /I go to user "(.*)" edit page/ do |username|
  step %(I press "#{username}")
end

And /I change the password to "([^\"]+)"/ do |password|
  step %(I fill in "user_password" with "#{password}")
  step %(I fill in "Password confirmation" with "#{password}")
  step %(I press "Update User")
end

Then(/^I logout$/) do
  step %(I press "Logout")
end

Then /^I should see "([^"]*)" within "([^"]*)"$/ do |text, selector|
  find(:xpath, "//#{selector}[contains(text(),'#{text}')]").should_not(be_nil, "Could not find the text '#{text}' within the selector '#{selector}'")
end