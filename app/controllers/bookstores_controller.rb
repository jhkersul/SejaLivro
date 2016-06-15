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

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:bookstore).permit(:name, :telephone, :cnpj)
  end

end

