class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :failed, :info
  rescue_from ActionController::RoutingError, :with => :pageNotFound
  rescue_from StandardError, :with => :pageError

  def pageNotFound
    render "errors/404.html", :status => 404
  end

  def pageError
    render "errors/500.html", :status => 500
  end
end
