Given /^(?:|I )am looking at src of (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then(/^I should see a title "(.*?)"$/) do |title|
   page.should have_title(title) 
end

Then(/^I should see an alert success message "(.*?)"$/) do |message|
   page.should have_selector('div.alert.alert-success', text: message) 
end

Then(/^I should see an alert error message "(.*?)"$/) do |message|
   page.should have_selector('div.alert.alert-error', text: message) 
end

And /^(?:|I )should no longer see the error message$/ do 
   page.should_not have_selector('div.alert.alert-error') 
end

Then(/^I should see a notice message "(.*?)"$/) do |message|
   page.should have_selector('div.alert.alert-notice', text: message) 
end

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then(/^I should see "(.*?)"$/) do |content|
  page.should have_text(content)
end

Then(/^I should not see "(.*?)"$/) do |content|
  page.should_not have_text(content)
end

And /^(?:|there )should be a link (.+)$/ do |button_name|
  find_link (button_name)
end

Then /^I should not see the link "([^\"]*)"$/ do |linked_text|
  page.should_not have_css("a", :text => linked_text)
end

And /^(?:|I )click on link (.+)$/ do |link_name|
  click_link (link_name)
end

And /^(?:|I )click on the first link "([^\"]*)"$/ do |link_name|
  page.all(:link,link_name)[0].click
end

Given /^(?:|I )am showing (.+)$/ do |page_name|
  visit show_path_to(page_name)
end

And /^(?:|there )should be a button (.+)$/ do |button_name|
  find_button (button_name)
end




And /^(?:|I )click on the button (.+)$/ do |button_name|
  click_button (button_name)
end

And /^the "([^\"]*)" field should contain "([^\"]*)"$/ do |field, value|
  field_labeled(field).value.should =~ /#{value}/
end

And /^the "([^\"]*)" field should be empty$/ do |field|
  field_labeled(field).value.should == nil
end


