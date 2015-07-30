module Admin
  class RestaurantsController < ApplicationController
    before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

    # GET /restaurants
    # GET /restaurants.json
    def index
      @restaurants = Restaurant.all
    end

    # GET /restaurants/1
    # GET /restaurants/1.json
    def show
      @building = Building.find(@restaurant.building_id).name
      @foodstyle = FoodStyle.find(@restaurant.food_style_id).name
    end

    # GET /restaurants/new
    def new
      @restaurant = Restaurant.new
    end

    # GET /restaurants/1/edit
    def edit
    end

    # POST /restaurants
    # POST /restaurants.json
    def create
      @restaurant = Restaurant.new(restaurant_params)

      respond_to do |format|
        if @restaurant.save
          format.html { redirect_to admin_restaurant_path(@restaurant), notice: 'Restaurant was successfully created.' }
          format.json { render :show, status: :created, location: @restaurant }
        else
          format.html { render :new }
          format.json { render json: @restaurant.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /restaurants/1
    # PATCH/PUT /restaurants/1.json
    def update
      respond_to do |format|
        if @restaurant.update(restaurant_params)
          format.html { redirect_to admin_restaurant_path(@restaurant), notice: 'Restaurant was successfully updated.' }
          format.json { render :show, status: :ok, location: @restaurant }
        else
          format.html { render :edit }
          format.json { render json: @restaurant.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /restaurants/1
    # DELETE /restaurants/1.json
    def destroy
      @restaurant.destroy
      respond_to do |format|
        format.html { redirect_to admin_restaurants_url, notice: 'Restaurant was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_restaurant
        @restaurant = Restaurant.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def restaurant_params
        params.require(:restaurant).permit(:name, :description, :address, :picture, :phone_1, :phone_2, :qq, :qr_code, :minimum_order, :delivery_charge, :star_rating, :is_active, :building_id, :food_style_id)
      end
  end
end
