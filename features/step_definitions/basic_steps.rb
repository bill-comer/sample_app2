Given /^(?:|I )am on (.+)$/ do |page_name|
  visit path_to(page_name)
end



Then(/^I should be see "(.*?)"$/) do |arg1|
  page.should have_text(arg1)
end