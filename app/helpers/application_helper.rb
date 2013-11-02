require 'redcarpet'

module ApplicationHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML
    Redcarpet::Markdown.new(renderer, {}).render(text).html_safe
  end
end
