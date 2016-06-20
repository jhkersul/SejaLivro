class MainController < ApplicationController
  layout "application"

  def index
    @categories = Category.all.order(:id)

    @peridiocities = ["Semanal" , "Quinzenal", "Mensal", "Bimestral", "Trimestral"]
    @quantities = ["1" , "2", "3", "4", "5"]
    @periods = ["1 ano" , "2 anos", "3 anos", "4 anos", "5 anos"]
  end
end
