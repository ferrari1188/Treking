class JourneysController < ApplicationController
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def show
    @journey = Journey.find(params[:id])
  end

  def new
    @journey = Journey.new
  end

  def create
    @journey = Journey.new(journey_params)
    @journey.user = current_user
    @journey.route = @route
    if @journey.save!
      redirect_to route_journeys_path(@route, @journey), notice: 'Journey successfully created.'
    else
      render :new
    end
  end

  def edit
    @route = Route.find(params[:route_id])
    @journey = Journey.find(params[:id])
  end

  def update
    @route = Route.find(params[:route_id])
    @journey = Journey.find(params[:id])
    @journey.user = current_user
    @journey.route = @route
    if @journey.save!
      redirect_to route_journeys_path(@route, @journey), notice: 'Journey successfully completed.'
    else
      render :edit
    end
  end

  def journey_params
    params.require(:journey).permit(:journey_start, :journey_end, :completed)
  end
end
