class Readers::ReturnedBooksController < ApplicationController

    def returnbook
        @emails=User.joins(:role).where("roles.name = ?", "Admin").pluck("users.email")
        
        @book=IssuedBook.find(params[:id])
        @book.book.toggle!(:available)
        session[:book_id]=@book.book.id
        # @bookrating=@book.book
        if @book.update(returned: true, user_returned_date: Time.now.to_date)
            @fine= (Time.now.to_date-@book.return_date.to_date).to_i
            if @fine>0
                @fine=@fine*100
                DueAmount.create(issued_book_id: params[:id], fine: @fine)
                for @email in @emails
                    BookReturnMailer.with(book: @book,fine: @fine,email: @email).new_book_returned.deliver_now
                end
                
            else
                @fine=0
                for @email in @emails
                    BookReturnMailer.with(book: @book,fine: @fine,email: @email).new_book_returned.deliver_now
                end
                # redirect_to readers_issued_books_path
            end
        else
            # redirect_to root_path
        end
    end
end
