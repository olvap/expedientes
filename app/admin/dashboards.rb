ActiveAdmin::Dashboards.build do

  section "Cambios recientes" do
    table_for Version.order('id desc').limit(20) do
      column "Item" do |v| link_to v.item_id, v.item.admin_permalink if v.item end
      column "Tipo" do |v| v.item_type.underscore.humanize end
      column "Modificado en" do |v| v.created_at.to_s :long end
      column "Accion" do |v| v.event end
      column "Usuario" do |v| link_to AdminUser.find(v.whodunnit).email, admin_admin_user_path(v.whodunnit) end
    end
  end
  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end
  
  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.

end
