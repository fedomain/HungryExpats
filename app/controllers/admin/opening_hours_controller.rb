module Admin
	class OpeningHoursController < AdminController
		before_action :set_opening_hour, only: [:show, :edit, :update, :destroy]
    before_action :set_restaurant, only: [:index, :show, :new, :edit, :create]

	  def index
	  	@opening_hours = OpeningHour.where('restaurant_id = ?', params[:restaurant_id]).order('day ASC')
	  end

	  def show
	  end

	  def new
	  	@opening_hour = OpeningHour.new
	  end

    def edit
    end

	  def create
      @opening_hour = @restaurant.opening_hours.create(opening_hour_params)

      if @opening_hour.save
        redirect_to admin_restaurant_opening_hour_path(@opening_hour.restaurant_id, @opening_hour.id)
      else
        render 'new'
      end
    end

    def update
      if @opening_hour.update(opening_hour_params)
        redirect_to admin_restaurant_opening_hour_path(@opening_hour.restaurant_id, @opening_hour.id)
      else
        render 'edit'
      end
    end

    def destroy
      @opening_hour.destroy

      redirect_to admin_restaurant_opening_hours_path
    end

	  private

    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_opening_hour
      @opening_hour = OpeningHour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def opening_hour_params
      params.require(:opening_hour).permit(:day, :start_time, :end_time)
    end
	end
end
