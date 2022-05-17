class Readers::RatingsController < ApplicationController
    def create
        Rating.create(user_id: current_user.id, book_id: session[:book_id], rating: params[:rating])
        redirect_to readers_books_path, notice: t("book returned")
    end

    def index
      @ratings=Rating.where(user_id:current_user.id)
    end

end
