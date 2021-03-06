class ReviewsMiler < ActionMailer::Base
  default :from => "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reviews_miler.new_review_email.subject
  #
  def new_review_email(book, review)
  	@book = book
  	@review = review
    mail(:to => @book.readers.collect{|r| r.email}, :subject=>"New review for #@book.ttle") 
  end
end
