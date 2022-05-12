class Readers::TopRatedBooksController < ApplicationController
    
    def index
        # binding.pry
        @books=Book.joins(:ratings).select("books.id, avg(ratings.rating) as average_rating, count(ratings.id) as number_of_reviews").group("books.id").order("average_rating DESC, number_of_reviews DESC")
        # @array1=[]

        # a=Rating.group("book_id").order("rating DESC").sum('rating') # returns hash
        # a.keys.each do |book|
        #    @book=Book.find(book)
        #    @array1.push(@book)
        # end
    end



end
