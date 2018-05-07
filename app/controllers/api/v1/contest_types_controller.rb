class Api::V1::ContestTypesController < Api::V1::ApiController
  # In this example we are using a service again however it is very basic!
  # But even though this service does nothing (really) now, it might later.
  def index
    render json: ContestTypeService.all
  end
end
