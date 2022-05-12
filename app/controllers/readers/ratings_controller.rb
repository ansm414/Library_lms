class Readers::RatingsController < ApplicationController


    def create

        
        
        # binding.pry


        Rating.create(user_id: current_user.id, book_id: session[:book_id], rating: params[:rating])
        redirect_to readers_books_path, notice: "Book Has Been Returned"
        # @old_val=Book.select('rating').where(id:session[:book_id]) # returns an array
        # if @old_val[0].rating==nil
        #     @yes=Book.where(id: session[:book_id]).update(rating:params[:rating].to_i)
        #      redirect_to readers_issued_books_path

        # else
        #     @yes=Book.where(id: session[:book_id]).update(rating:params[:rating].to_i+@old_val[0].rating)

        # end

        
    end

    def index()
        
      @ratings=Rating.where(user_id:current_user.id)
    end

end
