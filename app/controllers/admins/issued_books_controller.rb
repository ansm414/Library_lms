class Admins::IssuedBooksController < ApplicationController
    before_action :setid, only: [:savebook, :rejectbook]
    def index
        @books=IssuedBook.all
        authorize([:Admin,@books])
    end

    def savebook
        time1 = Time.new
        authorize([:Admin,@book])
        @book.status="approved"
        @book.book.toggle!(:available)
        if @book.save
           @issuedbook=IssuedBook.create(user_id: @book.user_id, book_id: @book.book_id, issue_date: time1.to_date, return_date: time1.to_date + 5.days)
            if @issuedbook.save
                BookIssueMailer.with(book: @issuedbook).new_book_issued.deliver_now
                redirect_to admins_issued_books_path,notice: t("issued book")
            else
            redirect_to root_path
            end

        else
            redirect_to root_path
        end

    end

    def rejectbook
        authorize([:Admin,@book])
        @book.status="rejected"
        if @book.save
            redirect_to admins_rejected_path,alert: t("reject book")
        else
            redirect_to admins_books_path
        end
    end

    def returnedbooks
        @books=IssuedBook.where(returned: true)
        authorize([:Admin,@books])
    end

    private

        def setid
            @book=RequestedBook.find(params[:id])
        end
end
