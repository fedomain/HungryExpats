class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :edit, :update, :destroy]
  before_action :set_restaurant, only: [:index, :show, :new, :edit, :create]

  # GET /dishes
  # GET /dishes.json
  def index
    @dishes = Dish.where('restaurant_id = ?', params[:restaurant_id]).order('dish_category_id, name ASC')
  end

  # GET /dishes/1
  # GET /dishes/1.json
  def show
    @dish_category = DishCategory.find(@dish.dish_category_id).name
  end

  # GET /dishes/new
  def new
    @dish = Dish.new
  end

  # GET /dishes/1/edit
  def edit
  end

  # POST /dishes
  # POST /dishes.json
  def create
    @dish = @restaurant.dishes.create(dish_params)

    #redirect_to article_path(@article)


    #@dish = Dish.new(dish_params)

    respond_to do |format|
      if @dish.save
        format.html { redirect_to restaurant_dish_path(@dish.restaurant_id, @dish.id), notice: 'Dish was successfully created.' }
        format.json { render :show, status: :created, location: @dish }
      else
        format.html { render :new }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dishes/1
  # PATCH/PUT /dishes/1.json
  def update
    respond_to do |format|
      if @dish.update(dish_params)
        format.html { redirect_to restaurant_dish_path(@dish.restaurant_id, @dish.id), notice: 'Dish was successfully updated.' }
        format.json { render :show, status: :ok, location: @dish }
      else
        format.html { render :edit }
        format.json { render json: @dish.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dishes/1
  # DELETE /dishes/1.json
  def destroy
    @dish.destroy
    respond_to do |format|
      format.html { redirect_to dishes_url, notice: 'Dish was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dish_params
      params.require(:dish).permit(:name, :description, :price, :picture, :spiciness, :is_available, :has_options, :is_active, :dish_category_id)
    end
end
