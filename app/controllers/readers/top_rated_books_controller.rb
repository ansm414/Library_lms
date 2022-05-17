class Readers::TopRatedBooksController < ApplicationController
    
    def index
        # below line finds the ids of books in descending order
        @books=Book.joins(:ratings).select("books.id, avg(ratings.rating) as average_rating, count(ratings.id) as number_of_reviews").group("books.id").order("average_rating DESC, number_of_reviews DESC")
    end
end
