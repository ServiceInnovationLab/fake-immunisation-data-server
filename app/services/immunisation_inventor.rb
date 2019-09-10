class ImmunisationInventor

  def initialize(date_of_birth: 5.years.ago)
    @date_of_birth = date_of_birth
  end

  def full_immunisation_coverage
    immunisations = []
    ImmunisationSchedule.schedule_for_date_of_birth(@date_of_birth).each do |schedule_item|
      immunisations << self.send(schedule_item[:immunisation], {date: schedule_item[:date_due]})
    end
    immunisations
  end

  private

  def dtap_ipv_hepb_hib(date: 2.days.ago)
    imm = FHIR::Immunization.new
    imm.manufacturer = FHIRReferences.gsk
    imm.route = FHIRReferences.intramuscular
    imm.site = [FHIRReferences.left_vastus_lateralis, FHIRReferences.right_vastus_lateralis].sample,
    imm.vaccineCode = FHIRReferences.vaccine_code(
        code: 'IFHX',
        display: 'DTaP-IPV-HepB/Hib',
        text: 'Infanrix-hexa'
      )
    imm.occurrenceDateTime = date.iso8601
    imm.note = FHIR::Annotation.new(text: "Protects against diphtheria, tetanus, pertussis (whooping cough), polio, hepatitis B and Haemophilus influenzae type b (Hib).")
    imm
  end

  def synflorix(date: 2.days.ago)
    imm = FHIR::Immunization.new
    imm.manufacturer = FHIRReferences.gsk
    imm.route = FHIRReferences.intramuscular
    imm.site = [FHIRReferences.left_vastus_lateralis, FHIRReferences.right_vastus_lateralis].sample,
    imm.vaccineCode = FHIRReferences.vaccine_code(
        code: 'SYNFLX',
        display: 'PCV10',
        text: 'Synflorix'
      )
    imm.occurrenceDateTime = date.iso8601
    imm.note = FHIR::Annotation.new(text: 'Protects against pneumococcal disease caused by at least 10 types of Streptococcus pneumoniae.')
    imm
  end

  def rotarix(date: 2.days.ago)
    imm = FHIR::Immunization.new
    imm.manufacturer = FHIRReferences.gsk
    imm.route = FHIRReferences.oral
    imm.vaccineCode = FHIRReferences.vaccine_code(
        code: 'ROTRIX',
        display: 'RV1',
        text: 'Rotarix'
      )
    imm.occurrenceDateTime = date.iso8601
    imm.note = FHIR::Annotation.new(text: 'Protects against rotavirus.')
    imm
  end

  def priorix(date: 2.days.ago)
    imm = FHIR::Immunization.new
    imm.manufacturer = FHIRReferences.gsk
    imm.route = FHIRReferences.subcutaneous
    imm.site = [FHIRReferences.left_arm, FHIRReferences.right_arm].sample,
    imm.vaccineCode = FHIRReferences.vaccine_code(
        code: 'MMRSKB',
        display: 'MMR',
        text: 'Priorix'
      )
    imm.occurrenceDateTime = date.iso8601
    imm.note = FHIR::Annotation.new(text: 'Protects against measles, mumps and rubella.')
    imm
  end

  def hiberix(date: 2.days.ago)
    imm = FHIR::Immunization.new
    imm.manufacturer = FHIRReferences.gsk
    imm.route = FHIRReferences.intramuscular
    imm.site = [FHIRReferences.left_vastus_lateralis, FHIRReferences.right_vastus_lateralis].sample,
    imm.vaccineCode = FHIRReferences.vaccine_code(
        code: 'HBX',
        display: 'Hib',
        text: 'Hiberix'
      )
    imm.occurrenceDateTime = date.iso8601
    imm.note = FHIR::Annotation.new(text: 'Protects against Haemophilus influenzae type b (Hib) disease.')
    imm
  end

  def varilrix(date: 2.days.ago)
    imm = FHIR::Immunization.new
    imm.manufacturer = FHIRReferences.gsk
    imm.route = FHIRReferences.subcutaneous
    imm.site = [FHIRReferences.left_arm, FHIRReferences.right_arm].sample,
    imm.vaccineCode = FHIRReferences.vaccine_code(
        code: 'VLRIX',
        display: 'VV',
        text: 'Varilrix'
      )
    imm.occurrenceDateTime = date.iso8601
    imm.note = FHIR::Annotation.new(text: 'Protects against varicella (chickenpox).')
    imm
  end

  def infanrix_ipv(date: 2.days.ago)
    imm = FHIR::Immunization.new
    imm.manufacturer = FHIRReferences.gsk
    imm.route = FHIRReferences.intramuscular
    imm.site = [FHIRReferences.left_vastus_lateralis, FHIRReferences.right_vastus_lateralis].sample,
    imm.vaccineCode = FHIRReferences.vaccine_code(
        code: 'IFIP',
        display: 'DTaP-IPV',
        text: 'Infanrix-IPV'
      )
    imm.occurrenceDateTime = date.iso8601
    imm.note = FHIR::Annotation.new(text: 'Protects against diphtheria, tetanus, pertussis (whooping cough) and polio.')
    imm
  end

  def boostrix(date: 2.days.ago)
    imm = FHIR::Immunization.new
    imm.manufacturer = FHIRReferences.gsk
    imm.route = FHIRReferences.intramuscular
    imm.site = [FHIRReferences.left_deltoid, FHIRReferences.right_deltoid].sample,
    imm.vaccineCode = FHIRReferences.vaccine_code(
        code: '115',
        display: 'Tdap',
        text: 'Boostrix'
      )
    imm.occurrenceDateTime = date.iso8601
    imm.note = FHIR::Annotation.new(text: 'Protects against tetanus, diphtheria and pertussis (whooping cough).')
    imm
  end

  def gardasil(date: 2.days.ago)
    imm = FHIR::Immunization.new
    imm.manufacturer = FHIRReferences.seqirus
    imm.route = FHIRReferences.intramuscular
    imm.site = [FHIRReferences.left_deltoid, FHIRReferences.right_deltoid].sample,
    imm.vaccineCode = FHIRReferences.vaccine_code(
        code: '165',
        display: 'HPV9',
        text: 'Gardasil'
      )
    imm.occurrenceDateTime = date.iso8601
    imm.note = FHIR::Annotation.new(text: 'Protects against nine types of human papillomavirus.')
    imm
  end

  def adt_booster(date: 2.days.ago)
    imm = FHIR::Immunization.new
    imm.manufacturer = FHIRReferences.seqirus
    imm.route = FHIRReferences.intramuscular
    imm.site = [FHIRReferences.left_deltoid, FHIRReferences.right_deltoid].sample,
    imm.vaccineCode = FHIRReferences.vaccine_code(
        code: '138',
        display: 'Td',
        text: 'ADT Booster'
      )
    imm.occurrenceDateTime = date.iso8601
    imm.note = FHIR::Annotation.new(text: 'Protects against tetanus and diphtheria.')
    imm
  end

  def fluvac(date: 2.days.ago)
    imm = FHIR::Immunization.new
    imm.manufacturer = FHIRReferences.mylan
    imm.route = FHIRReferences.intramuscular
    imm.site = [FHIRReferences.left_deltoid, FHIRReferences.right_deltoid].sample,
    imm.vaccineCode = FHIRReferences.vaccine_code(
        code: 'INFLUV',
        display: 'Influenza',
        text: 'Influvac Tetra'
      )
    imm.occurrenceDateTime = date.iso8601
    imm.note = FHIR::Annotation.new(text: 'Annual flu vaccination.')
    imm
  end

  def zostavax(date: 2.days.ago)
    imm = FHIR::Immunization.new
    imm.manufacturer = FHIRReferences.msd
    imm.route = FHIRReferences.subcutaneous
    imm.site = [FHIRReferences.left_deltoid, FHIRReferences.right_deltoid].sample,
    imm.vaccineCode = FHIRReferences.vaccine_code(
        code: '121',
        display: 'HZV',
        text: 'Zostavax'
      )
    imm.occurrenceDateTime = date.iso8601
    imm.note = FHIR::Annotation.new(text: 'Protects against herpes zoster (shingles).')
    imm
  end
end
