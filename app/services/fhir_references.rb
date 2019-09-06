class FHIRReferences
  class << self
    def gsk
      FHIR::Reference.new(reference: "companies/GSK")
    end

    def seqirus
      FHIR::Reference.new(reference: "companies/Seqirus")
    end

    def mylan
      FHIR::Reference.new(reference: "companies/Mylan")
    end

    def msd
      FHIR::Reference.new(reference: "companies/MSD")
    end

    def left_arm
      route_of_administration(
        code: 'LA',
        display: 'Left arm'
      )
    end

    def right_arm
      route_of_administration(
        code: 'RA',
        display: 'Right arm'
      )
    end

    def left_deltoid
      route_of_administration(
        code: 'LD',
        display: 'Left deltoid'
      )
    end

    def right_deltoid
      route_of_administration(
        code: 'RD',
        display: 'Right deltoid'
      )
    end

    def left_vastus_lateralis
      route_of_administration(
        code: 'LVL',
        display: 'Left vastus lateralis'
      )
    end

    def right_vastus_lateralis
      route_of_administration(
        code: 'RVL',
        display: 'Right vastus lateralis'
      )
    end

    def left_deltoid
      route_of_administration(
        code: 'LD',
        display: 'Left deltoid'
      )
    end

    def right_deltoid
      route_of_administration(
        code: 'RD',
        display: 'Right deltoid'
      )
    end

    def intramuscular
      route_of_administration(
        code: 'IM',
        display: 'Injection, intramuscular'
      )
    end

    def subcutaneous
      route_of_administration(
        code: 'SQ',
        display: 'Injection, subcutaneous',
        text: 'Administered subcutaneously'
      )
    end

    def oral
      route_of_administration(
        code: 'SO',
        display: 'Swallow, oral'
      )
    end

    def route_of_administration(code:, display:, text: "")
      administration = FHIR::CodeableConcept.new(text: text)
      coding = FHIR::Coding.new(
        system: "https://www.hl7.org/fhir/v3/RouteOfAdministration",
        code: code,
        display: display
      )
      administration.coding = coding
      administration
    end

    def vaccine_code(code:, display:, text: "")
      vaccine = FHIR::CodeableConcept.new(text: text)
      coding = FHIR::Coding.new(
        system: "http://hl7.org/fhir/ValueSet/vaccine-code",
        code: code,
        display: display
      )
      vaccine.coding = coding
      vaccine
    end
  end
end
