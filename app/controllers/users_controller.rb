class UsersController < ApplicationController

  # Método que define o que ocorre quando abre-se a tela para cadastrar usuário
  # GET /users/register
  def cadastro
    @user = User.new
    1.times { @user.addresses.build}
  end


  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.addresses = []

    respond_to do |format|
      if @user.save
        @user.addresses.build(user_params[:addresses_attributes][0])
        @user.save
        format.html { redirect_to action: :index, notice: 'User created' }
        format.json { render :index, status: :created, location: @user }
      else
        format.html { render :register }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :cpf, :login, :birth_date, :password, :password_confirmation, :gender, :addresses_attributes => [ :zipcode, :city, :country, :state, :complement, :street, :quarter])
    end
end
