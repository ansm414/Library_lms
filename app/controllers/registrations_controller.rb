class RegistrationsController < DeviseController

    # protected

    #     def after_update_path_for(resource)
    #         binding.pry
    #             if current_user.role.name == "Admin" 
    #             redirect_to admins_categories_path
    #             else
    #             redirect_to readers_books_path
    #             end
    #         end
end
