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
          format.html {root_path}
      end
    end

    
    def availablebooks
        @books=Book.where(available: true)
    end

    def unavailablebooks
        @books=Book.where(available: false)
    end
end

