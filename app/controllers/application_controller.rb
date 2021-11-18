class ApplicationController < ActionController::Base
    protect_from_forgery

    def after_sign_in_path_for(user)
      origin_path = session[:origin_path]
      clear_origin_path
      if origin_path.present?
        origin_path
      else
        params[:target].presence || user_albums_path(user_id: current_user.id)
      end
    end
  
    private
  
    def authenticate_user!
      store_origin_path
      super
    end
  
    def store_origin_path
      session[:origin_path] = request.fullpath
    end
  
    def clear_origin_path
      session[:origin_path] = nil
    end

end
