class MainController < ApplicationController
  layout "application"

  def index
    @categories = Category.all.order(:id)
  end
end
