class BooksController < ApplicationController
  before_action :baria_book , only: [:edit]

  def create
    @user = current_user
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.category = Category.first

    tag_names = params[:book][:tag_name].split(',')

    if @book.save
        @book.save_tags(tag_names)
        redirect_to book_path(@book.id), notice:'You have created book successfully.'
    else
       render"index"
    end
  end

  def index
    @user = current_user
    @book = Book.new
    @categories = Category.all

  if params[:sort]
     @books = Book.all.order(params[:sort])
  else
    to = Time.current.at_end_of_day
    from = (to - 6.day).at_beginning_of_day
    @books = Book.all.includes(:favorited_users).
      sort {|a,b|
        b.favorited_users.includes(:favorites).where(created_at: from...to).size <=>
        a.favorited_users.includes(:favorites).where(created_at: from...to).size
      }
  end

  end

  def show
    @categories = Category.all
    @book = Book.new
    @user_book = Book.find(params[:id])
    @user = @user_book.user
    @book_comments = @user_book.book_comments.all
    @book_comment = current_user.book_comments.new
    impressionist(@user_book, nil, unique: [:session_hash.to_s])
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice:"You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

   private

   def book_params
     params.require(:book).permit(:title, :body, :rate, :category_id)
   end

   def baria_book
     unless Book.find(params[:id]).user_id == current_user.id
    # Book.find(params[:id]).user_id =! current_user.id
     redirect_to books_path
     end
   end

end
