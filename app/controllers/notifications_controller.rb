class NotificationsController < ApplicationController
  def index
    @notifications = Notification.all

    if params[:query].present?
      @notifications = Notification.near(params[:query])
    end
  end

  def near_me
  end

  def show
  end

  def create
    @route = Route.find(params[:route_id])
    @notification = Notification.new(notification_params)
    # @notification.user = current_user
    @notification.route = @route
    if @notification.save
      redirect_to route_path(@route), notice: 'Notification was successfully created.'
    else
      @waypoints = @route.waypoints
      @coordinates = @waypoints.map do |waypoint|
        [waypoint.longitude, waypoint.latitude]
      end
      @name = @route.name
      @notifications = @route.notifications
      render 'routes/show'
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:category, :latitude, :longitude, :notification_start, :description, :notification_end, :location)
  end
end
