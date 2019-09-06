class ImmunisationSchedule
  ScheduleItem = Struct.new(:immunisation, :ages)

  def self.schedule_for_date_of_birth(date_of_birth)
    schedule = []
    full_schedule.each do |schedule_item|
      schedule_item.ages.each do |age|
        age_at_vax = date_of_birth + age
        item = {immunisation: schedule_item.immunisation, date_due: age_at_vax}
        schedule << item unless age_at_vax.future?
      end
    end
    schedule
  end

  def self.full_schedule
    [
      ScheduleItem.new(:dtap_ipv_hepb_hib, [6.weeks, 3.months, 5.months]),
      ScheduleItem.new(:synflorix, [6.weeks, 3.months, 5.months, 15.months]),
      ScheduleItem.new(:rotarix, [6.weeks, 3.months]),
      ScheduleItem.new(:priorix, [15.months, 4.years]),
      ScheduleItem.new(:hiberix, [15.months]),
      ScheduleItem.new(:varilrix, [15.months]),
      ScheduleItem.new(:infanrix_ipv, [4.years]),
      ScheduleItem.new(:boostrix, [11.years]),
      ScheduleItem.new(:gardasil, [11.years]),
      ScheduleItem.new(:adt_booster, [45.years, 65.years]),
      ScheduleItem.new(:zostavax, [65.years])
    ]
  end
end
