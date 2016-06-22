class AddressController < ApplicationController

  def edit
  	@address = User.find(params[:id]).addresses.first

  	if @address.nil?
  		redirect_to profile_path
  	end
  end

  def update
  	@address = User.find(params[:id]).addresses.first

  	respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to profile_path }
        format.json { render action: :profile, status: :created, location: @user }
      else
        format.html { render action: :profile }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  def address_params
  	params.require(:address).permit(:zipcode, :city, :country, :state, :complement, :street, :quarter)
  end
end
