module ApplicationHelper

  def my_simple_format(content)
    if content.include? "<script>"
      content
    else
      content.html_safe
    end
  end

end
