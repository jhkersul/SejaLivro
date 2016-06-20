class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  # POST /users
  # POST /users.json
  def create
    @category = Category.new(categories_params)

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

  # GET /categories/:id/edit
  def edit
    @category = Category.find(params[:id])
    if @category.nil?
      redirect_to books_path
    end
  end

    def show
    @category = Category.find(params[:id])
    @category_user_prefs = @category.user_preferences
    @category_book_cats = @category.book_categories

  end 

  def index
    if user_signed_in?
      @categories = Category.all.order(:id)
    else
      redirect_to root_path
    end
  end

  # PATCH/PUT /bookstore/1
  # PATCH/PUT /bookstore/1.json
  def update
    @category = Category.find(params[:id])
    respond_to do |format|
      if @category.update(categories_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookstore/1
  # DELETE /bookstore/1.json
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_path, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

   def search
    @q = "%#{params[:query]}%"
    @categories = Category.where("lower(name) LIKE ?", @q.downcase).oder(:id)
    render 'index'
  end



  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def categories_params
    params.require(:category).permit(:name, :image_url)
  end

end
