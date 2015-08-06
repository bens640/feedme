module HomeHelper
  def no_one_logged_in?
    not someone_logged_in?
  end

  def someone_logged_in?
    current_user or current_chef
  end

  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id])
  # end
  #
  # def current_chef
  #   @current_chef ||= Chef.find_by(id: session[:chef_id])
  # end
  # def is_logged_in
  #   current_chef || current_user
  # end
  # def is_admin?
  #   (current_user && current_user.email == 'admin@admin.com') ? true : false
  # end
  # def chef_active?
  #   current_chef.active?
  # end

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
