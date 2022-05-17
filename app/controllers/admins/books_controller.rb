class Admins::BooksController < ApplicationController
    before_action :setid, only:[:show, :edit, :destroy,:update]
    def index
        @q=Book.ransack(params[:q])
        @books=@q.result(distinct:true).page(params[:page])
        authorize([:Admin, @books])
    end

    def new
        @book=Book.new
        authorize([:Admin, @book])
    end

    def show
        authorize([:Admin, @book])
    end

    def create
        @book=Book.new(books_params)
        authorize([:Admin, @book])
        if @book.save
            redirect_to admins_books_path, notice: t("book created")
        else
            render :new
        end
    end

    def edit
        authorize([:Admin, @book])
    end

    def update
        authorize([:Admin, @book])
        if @book.update(books_params)
           redirect_to admins_books_path, notice: t("book updated")
        else
            render :edit
        end
        
    end

    def destroy
        authorize([:Admin, @book])
        @book.destroy
        redirect_to admins_books_path, alert: t("book deleted"), status: 303
    end

    def searchbook
        @books=Book.where(category_id:params[:data])
        respond_to do |format|
         format.js
         format.html {admins_books_path}
     end
    end

    def availablebooks
        @q=Book.available_books.ransack(params[:q])
        @books=@q.result(distinct:true).page(params[:page])
        authorize([:Admin, @books])
    end

    def unavailablebooks
        @q=Book.unavailable_books.ransack(params[:q])
        @books=@q.result(distinct:true).page(params[:page])
        authorize([:Admin, @books])
    end

     private
     
        def books_params
            params.require(:book).permit(:name, :author, :description, :category_id, :book_image)
        end

        def setid
            @book=Book.find(params[:id])
        end
end
