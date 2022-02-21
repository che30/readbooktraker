module V1
  class MeasurmentsController < ApplicationController
    def index
      @measurements = current_user.measurements.includes(:book)
      json_response(@measurements)
    end

    def create
      @measurement = current_user.measurements.create!(measurement_params)
      json_response(@measurement, :created)
    end

    def show
      @measurement = Measurement.find(params[:id])
      json_response(@measurement)
    end

    private

    def measurement_params
      params.permit(:pages_read, :book_id, :user_id, :date)
    end
  end
end
