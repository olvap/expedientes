ActiveAdmin.setup do |config|
  # == Site Title
  #
  # Set the title that is displayed on the main layout
  # for each of the active admin pages.
  #
  config.site_title = "Municipalidad de Coronda"
  config.allow_comments_in = [ :admin ]
  config.register_javascript 'ckeditor/ckeditor.js'

  # Set the link url for the title. For example, to take
  # users to your main site. Defaults to no link.
  #
  # config.site_title_link = "/"

  # == Default Namespace
  #
  # Set the default namespace each administration resource
  # will be added to.
  #
  # eg:
  #   config.default_namespace = :hello_world
  #
  # This will create resources in the HelloWorld module and
  # will namespace routes to /hello_world/*
  #
  # To set no namespace by default, use:
  #   config.default_namespace = false
  #
  # Default:
  # config.default_namespace = :admin

  # == User Authentication
  #
  # Active Admin will automatically call an authentication
  # method in a before filter of all controller actions to
  # ensure that there is a currently logged in admin user.
  #
  # This setting changes the method which Active Admin calls
  # within the controller.
  config.authentication_method = :authenticate_admin_user!


  # == Current User
  #
  # Active Admin will associate actions with the current
  # user performing them.
  #
  # This setting changes the method which Active Admin calls
  # to return the currently logged in user.
  config.current_user_method = :current_admin_user


  # == Logging Out
  #
  # Active Admin displays a logout link on each screen. These
  # settings configure the location and method used for the link.
  #
  # This setting changes the path where the link points to. If it's
  # a string, the strings is used as the path. If it's a Symbol, we
  # will call the method to return the path.
  #
  # Default:
  # config.logout_link_path = :destroy_admin_user_session_path

  # This setting changes the http method used when rendering the
  # link. For example :get, :delete, :put, etc..
  #
  # Default:
  # config.logout_link_method = :get


  # == Admin Comments
  #
  # Admin comments allow you to add comments to any model for admin use
  #
  # Admin comments are enabled by default in the default
  # namespace only. You can turn them on in a namesapce
  # by adding them to the comments array.
  #
  # Default:
  # config.allow_comments_in = [:admin]


  # == Controller Filters
  #
  # You can add before, after and around filters to all of your
  # Active Admin resources from here.
  #
  # config.before_filter :do_something_awesome


  # == Register Stylesheets & Javascripts
  #
  # We recommend using the built in Active Admin layout and loading
  # up your own stylesheets / javascripts to customize the look
  # and feel.
  #
  # To load a stylesheet:
  #   config.register_stylesheet 'my_stylesheet.css'
  #
  # To load a javascript file:
  #   config.register_javascript 'my_javascript.js'
  module ActiveAdmin

    module Comments
      module Views
        class Comments < ActiveAdmin::Views::Panel
          def build_comment(comment)
            div :for => comment do
              div :class => "active_admin_comment_meta" do
                user_name = comment.author ? link_to(comment.author.email.split("@")[0],admin_admin_user_path(comment.author)) : "Anonymous"
                h4(user_name, :class => "active_admin_comment_author")
                span(pretty_format(comment.created_at))
              end
              div :class => "active_admin_comment_body" do
                my_simple_format(comment.body)
              end
              div :style => "clear:both;"
              if can? :edit, comment
                div link_to "Editar comentario", "/admin/active_admin_comments/#{comment.id}/edit"
              end
            end
          end

          def build_comments
            if record_comments.count > 0
              record_comments.each do |comment|
                build_comment(comment)
              end
            else
              build_empty_message
            end
            build_comment_form if !resource.read_attribute(:close)
          end

          def build_comment_form
          self << active_admin_form_for(ActiveAdmin::Comment.new, :url => comment_form_url, :html => {:class => "inline_form"}) do |form|
            form.inputs do
              form.input :resource_type, :value => ActiveAdmin::Comment.resource_type(@record), :as => :hidden
              form.input :resource_id, :value => @record.id, :as => :hidden
              form.input :body, :input_html => {:class => :ckeditor, :size => "80x8"}, :label => false
            end
            form.buttons do
              form.commit_button 'Add Comment'
            end
          end
        end
        end
      end
    end

    module Views

    # Renderer for the header of the application. Includes the page
    # title, global navigation and utility navigation.
      class HeaderRenderer
        protected
        def utility_navigation

          content_tag 'p', :id => "utility_nav", :class => 'header-item' do
            if current_active_admin_user?
              html = content_tag(:span, link_to(current_active_admin_user,admin_admin_user_path(current_active_admin_user)), :class => "current_user")
              if current_active_admin_user.topics.count > 0
                html << link_to("Mensajes en foro","/admin")
              end
              html << link_to("Salir","/admin/logout")
            end
          end
        end
      end
    end
  end
end
