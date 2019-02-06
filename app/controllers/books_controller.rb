class BooksController < ApplicationController
  def top
  end

  def index
    @books = Book.all.order('id asc')
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    book = Book.new(book_params)
    book.save
    flash[:notice] = 'Book creating was successfully!'
    redirect_to book_path(book.id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:notice] = 'Book editting was successfully!'
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

# 以下プライベートアクション
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
