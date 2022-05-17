class Readers::BooksController < ApplicationController
    def index
        @q=Book.ransack(params[:q])
        @books=@q.result(distinct:true).page(params[:page])
    end
    
    def show
        @book=Book.find(params[:id])
    end

    def searchbook
        @books=Book.where(category_id:params[:data])
        respond_to do |format|
          format.js
          format.html {readers_books_path}
      end
    end
        
    def availablebooks
        @books=Book.available_books
    end

    def unavailablebooks
        @books=Book.unavailable_books
    end
end

