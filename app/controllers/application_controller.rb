class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user
  helper_method :current_gift_event

  def users_index

    @users = User.all_formatted
    render applications: 'users_index'

  end

  def set_current_user
    User.current = current_user
  end

  private

  def current_gift_event
    @event ||= Event.find(params[:event_id])
  end

  def current_event
    @event ||= Event.find(params[:id])
  end

  def current_user_givers
    current_user.givers
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
  end

end
