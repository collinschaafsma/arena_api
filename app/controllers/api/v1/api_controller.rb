class Api::V1::ApiController < ApplicationController

  def render_error(msg, status=500)
    render json: { error:  msg }, status: status
  end
end
