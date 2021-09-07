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
    @notification.user = current_user
    @notification.route = @route
    if @notification.save
      redirect_to route_path(@route), notice: 'Notification was successfully created.'
    else
      render 'routes/show'
    end
  end

  # def edit
  # end

  # def update
  #   @notifications.update(notification_params)
  #   if @notifications.save
  #     redirect_to notification_path(@route), notice: 'notification was successfully updated.'
  #   else
  #     render :edit
  #   end
  # end

  private

  def notification_params
    params.require(:route).permit(:category, :latitude, :longitude, :notification_start, :description, :notification_end, :location)
  end
end
