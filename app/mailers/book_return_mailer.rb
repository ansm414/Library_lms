class BookReturnMailer < ApplicationMailer
    def new_book_returned
      
     
      
        @book = params[:book]
        @fine= params[:fine]
        @email= params[:email]

          mail(to: @email, subject: "One Book is returned!")
      end
end
