
Given /I am on (.+page)$/ do |page|
  visit path_to(page)
end

Given /I press "([^\"]+)"/ do |selector|
 click_on(selector)
end

Given /I fill in "([^\"]+)" with "([^\"]+)"/ do |field, value|
  fill_in field, :with => value
end