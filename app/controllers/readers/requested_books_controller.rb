class Readers::RequestedBooksController < ApplicationController
    
    def index
        @books=RequestedBook.where(user_id:current_user.id)
    end

    def savebook
      @book= RequestedBook.create(user_id: current_user.id, book_id: params[:id])
        if @book.save
            redirect_to readers_books_path, notice: t("request book")
        else
            redirect_to readers_books_path ,alert: t("cannot request")
        end
    end

    def pendingbooks
        @books=RequestedBook.where(status:"pending").where(user_id: current_user.id)
    end

    def rejectedbooks
        @books=RequestedBook.where(status:"rejected").where(user_id: current_user.id)
    end

end