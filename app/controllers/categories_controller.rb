class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  # POST /users
  # POST /users.json
  def create
    @category = Category.new(user_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to action: :new, notice: 'Category created' }
        format.json { render :new, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:category).permit(:name)
  end

end
