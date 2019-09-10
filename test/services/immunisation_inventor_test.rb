# frozen_string_literal: true

require 'test_helper'

class ImmunisationInventorTest < ActiveSupport::TestCase
  def test_full_coverage
    inventor = ImmunisationInventor.new(date_of_birth: 5.years.ago)
    assert inventor.full_immunisation_coverage.length == ImmunisationSchedule.schedule_for_date_of_birth(5.years.ago).length
  end

  def test_partial_coverage
    inventor = ImmunisationInventor.new(date_of_birth: 5.years.ago)
    full_coverage_length = inventor.full_immunisation_coverage.length
    assert inventor.partial_immunisation_coverage(coverage_rate: 1).length == full_coverage_length
    assert inventor.partial_immunisation_coverage(coverage_rate: 0.5).length == (full_coverage_length * 0.5).to_i
    assert inventor.partial_immunisation_coverage(coverage_rate: 0.3).length == (full_coverage_length * 0.3).to_i
  end
end
