# frozen_string_literal: true

class ImmunisationRecord < ApplicationRecord
  def immunisations
    data.map do |datapoint|
      FHIR::Immunization.new(datapoint)
    end
  end

  def update_or_populate_data(given_date_of_birth:)
    if given_date_of_birth == self.date_of_birth
      # no op right now
    else
      inventor = ImmunisationInventor.new(date_of_birth: given_date_of_birth)
      update!(data: inventor.full_immunisation_coverage, date_of_birth: given_date_of_birth)
    end
  end
end
