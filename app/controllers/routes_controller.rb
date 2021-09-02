class RoutesController < ApplicationController
  # geocoded_by :location
  # after_validation :geocode, if: :will_save_change_to_location?

  before_action :set_route, only: [:show, :edit, :update]

  def index
    @routes = Route.all
  end

  #   if params[:query].present?
  #     @routes = Route.near(params[:query])
  #   end
  # end

  # @markers = @routes.geocoded.map do |route|
  #   {
  #     lat: route.latitude,
  #     lng: route.longitude,
  #     info_window: render_to_string(partial: "info_window", locals: { route: route }),
  #     image_url: helpers.asset_url('marker2.png')
  #   }
  # end

  # def near_me
  # end

  def show
    @waypoints = @route.waypoints
    @coordinates = @waypoints.map do |waypoint|
      [waypoint.latitude, waypoint.longitude]
    end
  end

  # def new
  #   @route = Route.new
  # end

  # def create
  #   @route = Route.new(route_params)
  #   @route.user = current_user
  #   if @route.save
  #     redirect_to route_path(@route), notice: 'route was successfully created.'
  #   else
  #     render :new
  #   end
  # end

  # def edit
  # end

  # def update
  #   @route.update(route_params)
  #   if @route.save
  #     redirect_to route_path(@route), notice: 'route was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  # def route_params
  #   params.require(:route).permit(start_location, end_location)
  # end
end
