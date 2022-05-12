class Admins::IssuedBooksController < ApplicationController

    def index
        @books=IssuedBook.all
        authorize([:Admin,@books])
    end

    def savebook
        time1 = Time.new
        
        @book=RequestedBook.find(params[:id])
        authorize([:Admin,@book])
        @book.status="approved"
        @book.book.toggle!(:available)
        if @book.save
           @issuedbook=IssuedBook.create(user_id: @book.user_id, book_id: @book.book_id, issue_date: time1.to_date, return_date: time1.to_date + 5.days)
            
           if @issuedbook.save
            BookIssueMailer.with(book: @issuedbook).new_book_issued.deliver_now
            redirect_to admins_issued_books_path
            else
            redirect_to '/'
            end

        else
        redirect_to '/'
        end

    end

    def rejectbook
        @book=RequestedBook.find(params[:id])
        authorize([:Admin,@book])
        @book.status="rejected"
        if @book.save
            redirect_to admins_rejected_path
        else
            redirect_to '/'
        end
    end

    def returnedbooks
        @books=IssuedBook.where(returned: true)
        authorize([:Admin,@books])
    end

end
