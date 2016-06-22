class MainController < ApplicationController
  layout "application"

  def index
    @categories = Category.all.order(:id)

    @peridiocities = Periodicity.all
    @quantities = ["1" , "2", "3", "4", "5"]
    @periods = ["1 ano" , "2 anos", "3 anos", "4 anos", "5 anos"]
  end

  def store_signature
    form_signature_params = params[:form_signature]

    cookies[:waiting_for_payment] = true
    cookies[:form_signature_peridiocity] = form_signature_params[:peridiocity]
    cookies[:form_signature_quantity] = form_signature_params[:quantity]
    cookies[:form_signature_period] = form_signature_params[:period]
    cookies[:form_signature_resulted_value] = form_signature_params[:resulted_value]
    cookies[:form_signature_selected_categories] = form_signature_params[:selected_categories]

    if user_signed_in?
      redirect_to "/pagamento"
    else
      redirect_to new_user_session_path
    end
  end

end
