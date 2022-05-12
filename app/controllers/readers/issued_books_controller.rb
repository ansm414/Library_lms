class Readers::IssuedBooksController < ApplicationController
    def index
        @books=IssuedBook.where(user_id:current_user.id)
    end
    def returnedbooks
        @books=IssuedBook.where(returned: true).where(user_id:current_user.id)
    end
end

