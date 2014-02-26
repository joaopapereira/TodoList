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
  step %(I follow "Logout")
end

Given /^I am logged in as "([^\"]*)" with password  "([^\"]*)"$/ do |email, password|
  step %(I am on the homepage)
  step %(I follow "Log in")
  step %(I fill in "Email address" with "#{email}")
  step %(I fill in "Password" with "#{password}")
  step %(I press "Continue")
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