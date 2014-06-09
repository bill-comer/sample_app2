module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
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
    end
  end
end

World(NavigationHelpers)
