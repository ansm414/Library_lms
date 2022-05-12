class BookIssueMailer < ApplicationMailer
    def new_book_issued
        @book = params[:book]
    
        mail(to: @book.user.email, subject: "You got a new order!")
      end
end
