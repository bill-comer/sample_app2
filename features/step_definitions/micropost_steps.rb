And /^I have a micropost "(.*?)"$/ do |post_content|
  @micropost1 = @new_user.microposts.create(content: post_content)
end

And(/^I can see my micropost "(.*?)"$/) do |content|
  page.should have_text(content)
end

And /^I am visiting the microposts_index page$/ do 
  visit edit_user_path(@new_user)
end

And /^the number of microposts should not change$/ do 
  @new_user.microposts should be_nil
end

And(/^I fill in a post "(.*?)"$/) do |content|
  fill_in 'micropost_content', :with => content
end


And /^I fill in a too big post$/ do 
  fill_in 'micropost_content', :with => (0...150).map { ('a'..'z').to_a[rand(26)] }.join
end

And(/^the number of microposts should be "(.*?)"$/) do |num_posts|
  @new_user.microposts should_not be_nil
  @new_user.microposts.count == num_posts
end