And /^I have a micropost "(.*?)"$/ do |post_content|
  @micropost1 = @new_user.microposts.build(content: "Lorem ipsum")
end

And(/^I can see my micropost "(.*?)"$/) do |content|
  page.should have_text(content)
end