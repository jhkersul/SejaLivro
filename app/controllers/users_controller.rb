class UsersController < ApplicationController

  # Método que define o que ocorre quando abre-se a tela para cadastrar usuário
  # GET /users/register
  def cadastro
    @user = User.new
    1.times { @user.addresses.build}
  end

  def logout
    sign_out :user
    redirect_to root_path
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
        @user.addresses.build(user_params[:addresses_attributes]["0"])
        @user.save

        format.html { redirect_to root_path, notice: 'User created' }
        format.json { render root_path, status: :created, location: @user }
      else
        format.html { render :cadastro }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  # Método que define o que ocorre quando abre-se a tela de perfil
  # GET /profile/:id
  def profile
    if user_signed_in? && current_user.id.to_s == params[:id]
      @user = User.find(params[:id])
      @user_signatures = @user.signatures
      @user_addresses = @user.addresses
      @user_books = @user.user_books
    else
      redirect_to root_path
    end
  end

def my_books
    if user_signed_in? && current_user.id.to_s == params[:id]
      @user = User.find(params[:id])
      @user_books = @user.user_books
      @user_prefs = @user.user_preferences
    else
      redirect_to root_path
    end
  end


  def index
    @users = User.all
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :cpf, :email, :login, :birth_date, :gender, :password, :password_confirmation, :addresses_attributes => [ :zipcode, :city, :country, :state, :complement, :street, :quarter])
    end



end