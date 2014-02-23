Given "I am not logged in" do
  Given %(I am on the homepage)
  And %(I follow "Log out")
end

Given /^I am logged in as "([^\"]*)" with password  "([^\"]*)"$/ do |email, password|
  Given %(I am on the homepage)
  And %(I follow "Log in")
  And %(I fill in "Email address" with "#{email}")
  And %(I fill in "Password" with "#{password}")
  And %(I press "Continue")
end