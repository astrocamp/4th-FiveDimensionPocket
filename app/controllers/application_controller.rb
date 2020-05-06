class ApplicationController < ActionController::Base
  layout :layout_by_resource

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == 'new'
      "for_user"
    end
  end
end
