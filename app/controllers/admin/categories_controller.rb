class Admin::CategoriesController < AdminController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.order(updated_at: :desc)
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        flash[:notice] = 'Category was successfully created.'
        format.html { redirect_to action: "index" }
        format.json { render :show, status: :created, location: @category }
      else
        flash[:alert] = 'Category was not created due to the error(s) below.'
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        flash[:notice] = 'Category was successfully updated.'
        format.html { redirect_to action: "index", notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        flash[:alert] = 'Category was not updated due to the error(s) below.'
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    if @category.artworks.count > 0
      respond_to do |format|
        format.html { redirect_to admin_categories_url, alert: 'Category was not deleted because it has artworks.' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    else
      @category.destroy
      respond_to do |format|
        format.html { redirect_to admin_categories_url, notice: 'Category was successfully deleted.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name)
    end
end
