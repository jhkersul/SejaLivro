class SignatureController < ApplicationController

  def payment
    if !user_signed_in?
      redirect_to root_path
      return
    end

    # Pegando categorias selecionadas
    selected_categories = cookies[:form_signature_selected_categories].split(",").map { |s| s.to_i }

    @categories = []

    selected_categories.each do |category_id|
      category = Category.find(category_id)
      @categories.append(category)
    end
  end

  def boleto_payment

  end

  def credit_card_payment
    @credit_card = CreditCard.new

    @installments = []

    unique_installment = cookies[:form_signature_resulted_value].to_f / 12

    for i in 1...12 do
      if i == 1
        installment = "#{i} parcela de #{'%.02f' % (unique_installment*i).to_f}"
      else
        installment = "#{i} parcelas de #{'%.02f' % (unique_installment*i).to_f}"
      end


      @installments.append(installment)
    end

  end

  def process_payment
    redirect_to "/profile/#{current_user.id}"
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def credit_card_params
    params.require(:credit_card).permit(:card_number)
  end

end
