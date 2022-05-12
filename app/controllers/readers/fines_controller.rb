class Readers::FinesController < ApplicationController
    def index
       @fines=DueAmount.where(issued_book_id: IssuedBook.where(user_id: current_user.id ))
    end

    def payfine
        # binding.pry
        @fine=DueAmount.find(params[:id])
        @fine.toggle!(:paid)
        redirect_to readers_paidfines_path , notice: "Fine Of This Book Has Been Paid"
    end

    def paidfines
        # binding.pry
        @fines=DueAmount.joins(:issued_book).where("issued_books.user_id = ?",  current_user.id).where(paid:true)
        # @fines=DueAmount.where(paid:true).where(iss)
    end

    def unpaidfines
        @fines=DueAmount.joins(:issued_book).where("issued_books.user_id = ?",  current_user.id).where(paid:false)
    end


end
