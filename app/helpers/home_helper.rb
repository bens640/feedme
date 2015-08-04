module HomeHelper
  def no_one_logged_in?
    not someone_logged_in?
  end

  def someone_logged_in?
    current_user or current_chef
  end

  # def active_if_current_page(path)  ##### , class: (active_if_current_page(new_user_path)
  #   current_page?(path) ? 'active' : ''
  # end

  # def item_list(items)   #########
  #   content_for(:head, javascript_include_tag 'bootstrap')
  #   html = "<div><ul>".html_safe
  #   items.each do |item|
  #     html += "<li>".html_safe + item.name + "</li>".html_safe
  #   end
  #   html += "</ul></div>".html_safe
  #   html
  # end

end
