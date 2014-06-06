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
      '/'
    when /the front-page/
      '/'
    when /the welcome page/
      '/'
    when /the static_pages help page/
      '/static_pages/help'
    when /the static_pages home page/
      '/static_pages/home'
    when /the static_pages about page/
      '/static_pages/about'
    end
  end
end

World(NavigationHelpers)
