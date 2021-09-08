class RoutesController < ApplicationController

  before_action :set_route, only: [:show, :map]

  def index
    if params[:query].present?
      @routes = Route.near(params[:query])
    else
      @routes = Route.all
    end
    @markers = @routes.geocoded.map do |route|
      {
        lat: route.latitude,
        lng: route.longitude,
        #  latitude: 53.364507286303024,
        #  longitude: -1.817374775658692,
        info_window: render_to_string(partial: "info_window", locals: { route: route }),
        image_url: helpers.asset_url('marker_test.png')
      }
    end
    p @markers.length
  end

  def show
    @waypoints = @route.waypoints
    @coordinates = @waypoints.map do |waypoint|
      [waypoint.longitude, waypoint.latitude]
    end
    @name = @route.name
    @notification = Notification.new
    @notifications = @route.notifications.order(created_at: :desc)
  end

  def map
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end
end
