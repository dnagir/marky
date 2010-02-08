# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def include_all_js
    javascript_include_tag('jquery-1.4.1.min',
      'jquery.colorbox-min',
      'application', :cache => true)
  end

  def include_all_css
    stylesheet_link_tag('reset', 'colorbox', 'formtastic', 'formtastic_changes', 'application', :cache => 'main')
  end

  def html_title(value)
    return nil unless value
    "title='#{value.gsub("'", "&quot;")}'"
  end

  def page_title(title)
    (title || "#{@controller.controller_name.humanize} - #{@controller.action_name.humanize}")
  end

end

