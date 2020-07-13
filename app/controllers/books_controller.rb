class BooksController < ApplicationController

  before_action :user_signed_in?

  layout 'application'
  def index
    @books = Book.all
  end

  def show
    id = params[:id]
    @book = Book.find(id)
    render layout: false
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(resources_params)
    if @book.save
      flash[:notice] = 'Book has been created'
      redirect_to books_path
    else
      render 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(resources_params)
    flash[:notice] = 'Book has been updated'
    redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = 'Book has been deleted'
    redirect_to books_path
  end

  private
  def resources_params
    params.require(:book).permit(:title,:description,:page,:price)
  end

end
