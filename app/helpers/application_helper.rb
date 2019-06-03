module ApplicationHelper

  def login_helper(style = '')
    if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path, class: style) +
      " ".html_safe +
      (link_to "Login", new_user_session_path, class: style)
    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} page"
      content_tag(:p, greeting, class: "source-greeting")
    end
  end

  def copyright_generator
    InsomniaViewTool::Renderer.copyright 'InsomniaNoir', 'All Rights Reserved'
  end

  def nav_items
    [
      {
        url: root_path,
        title: "Home"
      },
      {
        url: about_me_path,
        title: "About Me"
      },
      {
        url: blogs_path,
        title: "Blogs"
      },
      {
        url: folios_path,
        title: "Portfolio"
      },
      {
        url: contact_path,
        title: "Contact Me"
      },
      {
        url: my_tweets_path,
        title: "Tweets"
      },
    ]
  end

  def nav_helper(style, tag_type)
    nav_links = ''

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end


    nav_links.html_safe
  end

  def active?(path)
    "active" if current_page? path
  end

  def flash_class(level)
    case level
      when 'notice' then "alert alert-info"
      when 'success' then "alert alert-success"
      when 'error' then "alert alert-danger"
      when 'alert' then "alert alert-warning"
    end
  end

end
