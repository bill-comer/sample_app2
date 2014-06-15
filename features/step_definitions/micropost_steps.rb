And /^I have a micropost$/ do
  @micropost = Micropost.new(content: "Lorem ipsum", user_id: @new_user.id)
end

