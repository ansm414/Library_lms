class BookIssueMailer < ApplicationMailer
  def new_book_issued
    @book = params[:book]
    mail(to: @book.user.email, subject: "Request for #{@book.book.name} is approved!")
  end
end
