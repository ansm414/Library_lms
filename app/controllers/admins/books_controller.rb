class Admins::BooksController < ApplicationController
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
        @book=Book.find(params[:id])
        authorize([:Admin, @book])
    end
    def create
        
        @book=Book.new(books_params)
        authorize([:Admin, @book])
        
        if @book.save
            redirect_to admins_books_path, notice: "Book has been created Successfully"
        else
            render :new
        end
    end

    def edit
        @book=Book.find(params[:id])
        authorize([:Admin, @book])
        
    end

    def update
        @book=Book.find(params[:id])
        authorize([:Admin, @book])
        if @book.update(books_params)
           redirect_to admins_books_path, notice: "Book has been Updated Successfully"
        else
            render :edit
        end
        
    end

    def destroy
       
        @book=Book.find(params[:id])
        authorize([:Admin, @book])
        @book.destroy
        redirect_to admins_books_path,alert: "Book has been deleted Successfully", status: 303
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
        authorize([:Admin, @books])

    end

    def unavailablebooks
        @books=Book.where(available: false)
        authorize([:Admin, @books])
    end

     private
     
        def books_params
            params.require(:book).permit(:name, :author, :description, :category_id, :book_image)
        end

end
