class BooksController < ApplicationController
  # according to AI mentor
  # find book id that came from url
  # no need to write every line at [:show, :edit, :update, :destroy] like sample app
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created." # flash message
      redirect_to book_path(@book.id) # if true -> book id
    else
      @books = Book.all
      flash.now[:alert] = "Book creation error."
      render :index # if false -> same form and need to do again
      # redirect_to new_book_path -> this is for redirect
    end
  end

  def edit
  end

  def update
    # book = book.find(params[:id])
    # book.update(book_params)
    # redirect_to book_path(book.id)
    # need flash message to tell user that user's edit was successfull
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "Book was successfully updated."
    else
      flash.now[:alert] = "Book update error."
      render :edit
    end
  end

  def destroy
    @book.destroy
    flash[:notice] = "削除しました。"
    redirect_to books_path # redirect to book_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body) # strong parameters permit
  end

  # before-action method
  def set_book
    @book = Book.find(params[:id])
  end
end
