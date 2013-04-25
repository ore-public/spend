class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to url_for(controller: exception.message, action: :index), :alert => t("cancan.error")
  end

end
