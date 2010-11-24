class ReviewsController < ApplicationController
  
  before_filter :authenticate_user!, :only =>[:new , :edit , :update, :create, :destroy]
  def index
  end

  def show
  end

  def new
  @book = Book.find params[:book_id]
  @review = Review.new
  @review.book = @book
  @review.user = current_user
 #redirect_to new_user_session_path unless user_signed_in?
  end

  def edit
  @review=Review.find params[:id]
  @book = Review.find params[:book_id]
  end

  def update
  end

  def create
   @book = Book.find params[:book_id]
   @review = Review.new params[:review]
   @review.user= current_user
   @revier.book= @book
    if @review.save
   redirect_to book_review_path(@book, @review)
   else
    render :new 
   end
  end

  def destroy
  end

end
