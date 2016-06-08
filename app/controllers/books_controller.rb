class BooksController < ApplicationController

  def new
    @book = Book.new
    @categories = Category.all
  end

  # POST /users
  # POST /users.json
  def create
    @book = Book.new(user_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to action: :index, notice: 'Book created' }
        format.json { render :index, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:book).permit(:name, :isbn, :autor, :language, :publisher)
  end

end
