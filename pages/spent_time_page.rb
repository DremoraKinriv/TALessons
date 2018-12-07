class SpentTimePage < SitePrism::Page

  set_url "#{$site_url}/projects/a#{@project_id}/time_entries"

  require_relative 'menu_section'

  section :menu, Menu, '#top-menu'

  element :date_field, '#time_entry_spent_on'
  element :hours_field, '#time_entry_hours'
  element :create_button, '#new_time_entry > input[type="submit"]:nth-child(6)'



end