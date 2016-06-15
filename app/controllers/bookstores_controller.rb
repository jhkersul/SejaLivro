class BookstoresController < ApplicationController

  def new
    @bookstore = Bookstore.new
  end


  # POST /users
  # POST /users.json
  def create
    @bookstore = Bookstore.new(user_params)

    respond_to do |format|
      if @bookstore.save
        format.html { redirect_to action: :new, notice: 'Bookstore created' }
        format.json { render :new, status: :created, location: @bookstore }
      else
        format.html { render :new }
        format.json { render json: @bookstore.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @bookstore = Bookstore.find(params[:id])
    @bookstore_books = @bookstore.bookstore_books
    @bookstore_orders = @bookstore.orders
  end 

  def index
    @bookstores = Bookstore.all
  end



  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:bookstore).permit(:name, :telephone, :cnpj)
  end

end

