# frozen_string_literal: true

require 'test_helper'

class ImmunisationScheduleTest < ActiveSupport::TestCase
  def test_full_schedule
    schedule = ImmunisationSchedule.full_schedule
    assert schedule.is_a?(Array)
    assert schedule.first.respond_to?(:immunisation)
    assert schedule.first.respond_to?(:ages)
    assert schedule.first.ages.is_a?(Array)
    assert schedule.first.ages.first.is_a?(ActiveSupport::Duration)
  end

  def test_schedule_for_date_of_birth
    assert ImmunisationSchedule.schedule_for_date_of_birth(Date.today).empty?
    ten_yo_imms = ImmunisationSchedule.schedule_for_date_of_birth(10.years.ago)
    one_yo_imms = ImmunisationSchedule.schedule_for_date_of_birth(1.year.ago)
    assert ten_yo_imms.length > one_yo_imms.length
  end

  def test_three_immunisations_scheduled_for_6_weeks
    assert_equal 3, ImmunisationSchedule.schedule_for_date_of_birth(6.weeks.ago).length
  end

  def test_three_immunisations_scheduled_for_3_months
    one_less_imms = ImmunisationSchedule.schedule_for_date_of_birth((3.months - 1.day).ago)
    three_month_imms = ImmunisationSchedule.schedule_for_date_of_birth(3.months.ago)
    assert_equal 3, three_month_imms.length - one_less_imms.length
  end

  def test_two_immunisations_scheduled_for_5_months
    one_less_imms = ImmunisationSchedule.schedule_for_date_of_birth((5.months - 1.day).ago)
    five_month_imms = ImmunisationSchedule.schedule_for_date_of_birth(5.months.ago)
    assert_equal 2, five_month_imms.length - one_less_imms.length
  end

  def test_four_immunisations_scheduled_for_15_months
    one_less_imms = ImmunisationSchedule.schedule_for_date_of_birth((15.months - 1.day).ago)
    fifteen_month_imms = ImmunisationSchedule.schedule_for_date_of_birth(15.months.ago)
    assert_equal 4, fifteen_month_imms.length - one_less_imms.length
  end

  def test_two_immunisations_scheduled_for_4_years
    one_less_imms = ImmunisationSchedule.schedule_for_date_of_birth((4.years - 1.day).ago)
    four_years_imms = ImmunisationSchedule.schedule_for_date_of_birth(4.years.ago)
    assert_equal 2, four_years_imms.length - one_less_imms.length
  end

  def test_two_immunisations_scheduled_for_11_years
    one_less_imms = ImmunisationSchedule.schedule_for_date_of_birth((11.years - 1.day).ago)
    eleven_years_imms = ImmunisationSchedule.schedule_for_date_of_birth(11.years.ago)
    assert_equal 2, eleven_years_imms.length - one_less_imms.length
  end

  def test_one_immunisation_scheduled_for_45_years
    one_less_imms = ImmunisationSchedule.schedule_for_date_of_birth((45.years - 1.day).ago)
    forty_five_years_imms = ImmunisationSchedule.schedule_for_date_of_birth(45.years.ago)
    assert_equal 1, forty_five_years_imms.length - one_less_imms.length
  end

  def test_two_immunisations_scheduled_for_65_years
    one_less_imms = ImmunisationSchedule.schedule_for_date_of_birth((65.years - 1.day).ago)
    sixty_five_years_imms = ImmunisationSchedule.schedule_for_date_of_birth(65.years.ago)
    assert_equal 2, sixty_five_years_imms.length - one_less_imms.length
  end
end
