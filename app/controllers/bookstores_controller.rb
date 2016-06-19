class BookstoresController < ApplicationController

  def new
    @bookstore = Bookstore.new
  end

  # GET /books/1/edit
  def edit
    @bookstore = Bookstore.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @bookstore = Bookstore.new(bookstore_params)

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
    if user_signed_in?
      @bookstores = Bookstore.all
    else
      redirect_to root_path
    end
  end

  # PATCH/PUT /bookstore/1
  # PATCH/PUT /bookstore/1.json
  def update
    @bookstore = Bookstore.find(params[:id])
    respond_to do |format|
      if @bookstore.update(bookstore_params)
        format.html { redirect_to @bookstore, notice: 'Bookstore was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookstore }
      else
        format.html { render :edit }
        format.json { render json: @bookstore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookstore/1
  # DELETE /bookstore/1.json
  def destroy
    @bookstore = Bookstore.find(params[:id])
    @bookstore.destroy
    respond_to do |format|
      format.html { redirect_to bookstores_url, notice: 'Bookstore was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @q = "%#{params[:query]}%"
    @bookstores = Bookstore.where("lower(name) LIKE ?", @q.downcase)
    render 'index'
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def bookstore_params
    params.require(:bookstore).permit(:name, :telephone, :cnpj)
  end

end

