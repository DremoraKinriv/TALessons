class ProjectsPage < SitePrism::Page

  set_url "#{$site_url}/projects"

  require_relative 'menu_section'

  section :menu, Menu, '#top-menu'

  element :new_project_button, '#content > div.contextual > a'


end