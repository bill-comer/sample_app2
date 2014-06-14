module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def show_path_to(page_name)
    case page_name
      
    when /the ano user_profile page/
      user_path(@ano_user)
      
    when /the user_profile page/
      user_path(@new_user)
      
    when /the ano user_edit page/
      edit_user_path(@ano_user)
      
    when /the user_edit page/
      edit_user_path(@new_user)
    
    when /anouser from index page/
      delete user_path(@ano_user)
      
    end
  end
  
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      root_path
      
    when /the front-page/
      root_path
      
    when /the welcome page/
      root_path
      
    when /the static_pages help page/
      help_path
      
    when /the static_pages home page/
      root_path
      
    when /the static_pages about page/
      about_path
      
    when /the static_pages contact page/
      contact_path
      
    when /the signup page/
      signup_path
      
      
    when /the user_profile page/
      user_path
      
    when /the signin page/
      signin_path
      
    when /the user_edit page/
      edit_user_path
      
    end
  end
end

World(NavigationHelpers)
