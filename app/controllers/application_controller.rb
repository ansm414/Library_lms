class ApplicationController < ActionController::Base
    include Pundit::Authorization
    before_action :authenticate_user!
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :gender, :address, :role_id, :password_confirmation, :user_image) }
           
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :gender, :user_image, :address, :current_password) }
        end



        def after_sign_in_path_for(resource)    
            # binding.pry
            if current_user.role.name == "Admin" 
                admins_categories_path
            else
                readers_books_path
            end
           
        end

        def user_root_path
            if current_user.role.name == "Admin" 
                admins_categories_path
            else
                readers_books_path
            end
          end

        # def after_update_path_for(resource)
        #     if current_user.role.name == "Admin" 
        #         admins_categories_path
        #     else
        #         readers_books_path
        #     end
        # end



        private
      
        def user_not_authorized
          flash[:alert] = 'You are not authorized to perform this action.'
          redirect_to readers_books_path
        end








end


