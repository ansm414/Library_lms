class Admins::FinesController < ApplicationController
    def index
        @fines=DueAmount.all
        authorize([:Admin,@fines])
    end
    
    def paidfines
        @fines=DueAmount.where(paid:true)
        authorize([:Admin,@fines])
    end

    def unpaidfines
        @fines=DueAmount.where(paid:false)
        authorize([:Admin,@fines])
    end
end
