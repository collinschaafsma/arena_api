class Api::V1::ContestsController < Api::V1::ApiController
  before_action :instantiate_service,
    :only => [:index, :show, :create]

  def index
    render json: @service.all
  end

  def show
    render json: @service.find(params[:id])
  end

  def create
    contest = @service.create(contest_params)

    if contest.errors.empty?
      render json: { id: contest.id }, status: :created
    else
      render_error contest.errors
    end
  end

  private
  # Convenience method to instantiate our service. Makes it easy to swap out
  # service Object. ContestService default instantiates with the
  # Contest ActiveRecord class for basic persistance calls.
  # But we could pass any class into it here, or nothing.
  # Take a look at the ContestTypesController for a simpler approach where a Service
  # is not instantiated with anything and just exposes some class methods.
  def instantiate_service
    @service = ContestService.new
  end

  def contest_params
    params.require(:contest).permit(:contest_type, :contest_pets_attributes => [:pet_uid])
  end
end
