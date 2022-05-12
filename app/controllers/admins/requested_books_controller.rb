class Admins::RequestedBooksController < ApplicationController

    def index
        @q=RequestedBook.ransack(params[:q])
        @books=@q.result(distinct:true).page(params[:page])
        authorize([:Admin, @books])
    end

    def pendingbooks
        @books=RequestedBook.where(status: "pending")
        authorize([:Admin, @books])
    end

    def rejectedbooks
        @books=RequestedBook.where(status: "rejected")
        authorize([:Admin, @books])
    end
end
