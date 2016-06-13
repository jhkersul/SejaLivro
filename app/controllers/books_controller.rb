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
        format.html { redirect_to action: :new, notice: 'Book created' }
        format.json { render :new, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:book).permit(:name, :isbn, :author, :language, :publisher, :year)
  end

end
