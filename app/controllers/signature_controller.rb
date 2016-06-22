class SignatureController < ApplicationController

  def payment
    if !user_signed_in?
      redirect_to root_path
      return
    end

    # Pegando categorias selecionadas
    selected_categories = cookies[:form_signature_selected_categories]

    @categories = get_selected_categories(selected_categories)
    @peridiocity = Periodicity.find(cookies[:form_signature_peridiocity])
  end

  def boleto_payment

  end

  def credit_card_payment
    @installments = []

    unique_installment = cookies[:form_signature_resulted_value].to_f

    for i in 1...13 do
      if i == 1
        installment = "#{i} parcela de #{'%.02f' % (unique_installment / i).to_f}"
      else
        installment = "#{i} parcelas de #{'%.02f' % (unique_installment / i).to_f}"
      end


      @installments.append(installment)
    end

  end

  def process_payment_boleto
    ## CRIANDO ASSINATURA
    selected_categories = cookies[:form_signature_selected_categories]
    periodicity_id = cookies[:form_signature_peridiocity]
    quantity = cookies[:form_signature_quantity]
    period = cookies[:form_signature_period]
    resulted_value = cookies[:form_signature_resulted_value]
    categories = get_selected_categories(selected_categories)

    signature = Signature.new
    signature.user_id = current_user.id
    signature.periodicity_id = periodicity_id
    signature.save

    redirect_to "/profile/#{current_user.id}"
  end

  def process_payment_credit_card
    credit_card_params = params[:creditcard]

    ## CADASTRANDO CARTÃO DE  CRÉDITO
    name = credit_card_params[:name]
    card_number = credit_card_params[:name]
    installments = credit_card_params[:installments]

    credit_card = CreditCard.new
    credit_card.user_id = current_user.id
    credit_card.card_key = SecureRandom.hex(13)
    credit_card.name = name
    credit_card.brand = "NONE"
    credit_card.last_digits = 0
    credit_card.save


    ## CRIANDO ASSINATURA
    selected_categories = cookies[:form_signature_selected_categories]
    periodicity_id = cookies[:form_signature_peridiocity]
    quantity = cookies[:form_signature_quantity]
    period = cookies[:form_signature_period]
    resulted_value = cookies[:form_signature_resulted_value]
    categories = get_selected_categories(selected_categories)

    signature = Signature.new
    signature.user_id = current_user.id
    signature.periodicity_id = periodicity_id
    signature.save

    redirect_to "/profile/#{current_user.id}"
  end

  def get_selected_categories(selected_categories)
    selected_categories = selected_categories.split(",").map { |s| s.to_i }
    categories = []

    selected_categories.each do |category_id|
      category = Category.find(category_id)
      categories.append(category)
    end

    categories
  end

  def cancel_signature
    Signature.delete(params[:id].to_i)
    redirect_to "/profile/#{current_user.id}"
  end

end
