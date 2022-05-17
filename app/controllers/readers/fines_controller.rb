class Readers::FinesController < ApplicationController
    def index
       @fines=DueAmount.where(issued_book_id: IssuedBook.where(user_id: current_user.id ))
    end

    def payfine
        @fine=DueAmount.find(params[:id])
        @fine.toggle!(:paid)
        redirect_to readers_paidfines_path , notice: t("fine")
    end

    def paidfines
        @fines=DueAmount.user_paid_fines(current_user.id).where(paid:true)

        # @fines=DueAmount.joins(:issued_book).where("issued_books.user_id = ?",  current_user.id).where(paid:true)
    end

    def unpaidfines
        @fines=DueAmount.user_unpaid_fines(current_user.id).where(paid:false)
    end
end
