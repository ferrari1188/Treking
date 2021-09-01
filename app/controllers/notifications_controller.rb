class NotificationsController < ApplicationController
   def index
    @notifications = Notification.all

    if params[:query].present?
      @notifications = Notification.near(params[:query])
    end

     # @markers = @routes.geocoded.map do |route|
      # {
      #   lat: route.latitude,
      #   lng: route.longitude,
      #   info_window: render_to_string(partial: "info_window", locals: { route: route }),
      #   image_url: helpers.asset_url('marker2.png')
      #   }
      #   end
   # end

  def near_me
  end

  def show
  end


  def new
    @notifications = Notification.new
  end

  def create
    @notifications = Notification.new(notification_params)
    @notifications.user = current_user
    if @notifications.save
      redirect_to notification_path(@route), notice: 'notification was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @notifications.update(notification_params)
    if @notifications.save
      redirect_to notification_path(@route), notice: 'notification was successfully updated.'
    else
      render :edit
    end
  end
end
