class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :mailer_set_url_options, :myhelp

  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to :back, :alert => exception.message
  end

  def current_ability
    @current_ability ||= Ability.new(current_admin_user)
  end

  def current_user
    current_admin_user
  end

  def myhelp
    @help_topic = Topic.find_by_name(controller_name)
    @help_comment = @help_topic.try(:active_admin_comments).try(:first)
    @help_body = @help_comment.try(:body)
  end


end
