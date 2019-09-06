# frozen_string_literal: true

class ImmunisationRecord < ApplicationRecord
  def immunisations
    data.map do |datapoint|
      FHIR::Immunization.new(datapoint)
    end
  end

  def update_or_populate_data(date_of_birth:)
    inventor = ImmunisationInventor.new(date_of_birth: date_of_birth)
    update!(data: inventor.full_immunisation_coverage)
  end
end
