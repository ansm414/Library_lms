class Admins::FinesController < ApplicationController
    def index
        @fines=DueAmount.all
        authorize([:Admin,@fines])
    end
    
    def paidfines
        @fines=DueAmount.paid_fines
        authorize([:Admin,@fines])
    end

    def unpaidfines
        @fines=DueAmount.unpaid_fines
        authorize([:Admin,@fines])
    end
end
