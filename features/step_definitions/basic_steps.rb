Given /^(?:|I )am looking at src of (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then(/^I should see a title "(.*?)"$/) do |title|
   page.should have_title(title) 
end

Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

Then(/^I should see "(.*?)"$/) do |content|
  page.should have_text(content)
end

And /^(?:|I )click on link (.+)$/ do |link|
  click_link (link)
end
