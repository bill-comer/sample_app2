And /^I have a micropost "(.*?)"$/ do |post_content|
  @micropost1 = @new_user.microposts.create(content: post_content)
end

And(/^I can see my micropost "(.*?)"$/) do |content|
  page.should have_text(content)
end

And /^I am visiting the microposts_index page$/ do 
  visit edit_user_path(@new_user)
end