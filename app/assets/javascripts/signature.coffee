# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@selectedPaymentMethod = (paymentID) ->
  if paymentID == 0
    document.getElementById("go_to_payment").href = "/credit_card_payment"
  else
    document.getElementById("go_to_payment").href = "/boleto_payment"