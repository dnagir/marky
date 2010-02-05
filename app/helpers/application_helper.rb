# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def include_all_js
    javascript_include_tag('jquery-1.4.1.min',
      'jquery.colorbox-min',
      'application', :cache => true)
  end

  def include_all_css
    stylesheet_link_tag('colorbox', 'site', :cache => true)
  end

  def html_title(value)
    return nil unless value
    "title='#{value.gsub("'", "&quot;")}'"
  end

end

