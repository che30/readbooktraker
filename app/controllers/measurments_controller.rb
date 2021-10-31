class MeasurmentsController < ApplicationController
  def index
    @measurements = current_user.measurements
    json_response(@measurements)
  end
  def create
    @measurement = current_user.measurements.create!(measurement_params)
    json_response(@measurement, :created)
  end
  private
  def measurement_params
    params.permit(:pages_read,:user_id,:measurment)
  end
end
