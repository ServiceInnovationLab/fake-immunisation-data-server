# frozen_string_literal: true

class ImmunisationRecordsController < ApplicationController
  before_action :set_immunisation_record, only: %i[show]
  # GET /immunisation_records/1
  def show
    render json: @immunisation_record
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_immunisation_record
    @immunisation_record = ImmunisationRecord.find_or_create_by(feijoa_id: params[:feijoa_id])
    @immunisation_record.update_or_populate_data(
      date_of_birth: date_of_birth
    )
  end

  def date_of_birth
    params[:date_of_birth].present? ? Date.parse(params[:date_of_birth]) : 3.years.ago
  end
end
