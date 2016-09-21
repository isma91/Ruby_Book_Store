class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :failed, :info
  rescue_from ActionController::RoutingError, :with => :pageNotFound
  rescue_from StandardError, :with => :pageNotFound
  rescue_from ActionController::UnknownController, :with => :pageNotFound
  rescue_from ActiveRecord::RecordNotFound, :with => :pageNotFound

  def pageNotFound
    render "errors/404.html", :status => 404
  end
end
