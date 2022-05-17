class Admins::RequestedBooksController < ApplicationController

    def index
        @q=RequestedBook.ransack(params[:q])
        @books=@q.result(distinct:true).page(params[:page])
        authorize([:Admin, @books])
    end

    def pendingbooks
        @books=RequestedBook.pending_status
        authorize([:Admin, @books])
    end

    def rejectedbooks
        @books=RequestedBook.rejected_status
        authorize([:Admin, @books])
    end
end
