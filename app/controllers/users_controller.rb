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
    # Convertendo genero inteiro
    params[:user][:gender] = params[:user][:gender].to_i

    # Build nos parametros
    @user = User.new(user_params)
    @user.addresses = []

    respond_to do |format|
      if @user.save
        @user.addresses.build(user_params[:addresses_attributes][0])
        @user.save
        format.html { redirect_to root_path, notice: 'User created' }
        format.json { render root_path, status: :created, location: @user }
      else
        format.html { render :cadastro }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :cpf, :email, :login, :birth_date, :gender, :password, :password_confirmation, :addresses_attributes => [ :zipcode, :city, :country, :state, :complement, :street, :quarter])
    end
end
