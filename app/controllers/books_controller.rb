class BooksController < ApplicationController

  def new
    @book = Book.new
    @categories = Category.all
  end

  def index
    @books = Book.all
  end

  def edit
    if @book.nil?
      redirect_to books_path
    end
  end

  # POST /users
  # POST /users.json
  def create
    @book = Book.new(user_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to action: :index, notice: 'Book created' }
        format.json { render :new, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to action: :index, notice: 'Book updated' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if book = Book.find(params[:id])
      book.destroy
      redirect_to books_path
    end

  end
  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def book_params
    params.require(:book).permit(:name, :isbn, :author, :language, :publisher, :year)
  end

end
