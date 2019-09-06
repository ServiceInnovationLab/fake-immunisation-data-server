# Fake Immunisation Data Server

This application generates fake immunisation data based on the [New Zealand immunisation schedule](https://www.health.govt.nz/our-work/preventative-health-wellness/immunisation/new-zealand-immunisation-schedule) and serves it in [HL7 FHIR](https://www.hl7.org/fhir/immunization.html) format.

## API

`/immunisation_records/some_identifier?date_of_birth=1998-12-30`
This will return made-up immunisation records in the format:

```
// 20190906153424
// http://localhost:5000/immunisation_records/dfsfdsfd?date_of_birth=1980-03-09

{
  "id": 2,
  "data": [
    {
      "vaccineCode": {
        "coding": {
          "system": "http://hl7.org/fhir/ValueSet/vaccine-code",
          "code": "IFHX",
          "display": "DTaP-IPV-HepB/Hib"
        },
        "text": "Infanrix-hexa"
      },
      "occurrenceDateTime": "1980-04-20",
      "manufacturer": {
        "reference": "companies/GSK"
      },
      "site": [
        {
          "coding": {
            "system": "https://www.hl7.org/fhir/v3/RouteOfAdministration",
            "code": "LVL",
            "display": "Left vastus lateralis"
          }
        },
        {
          "coding": {
            "system": "http://hl7.org/fhir/ValueSet/vaccine-code",
            "code": "IFHX",
            "display": "DTaP-IPV-HepB/Hib"
          },
          "text": "Infanrix-hexa"
        }
      ],
      "route": {
        "coding": {
          "system": "https://www.hl7.org/fhir/v3/RouteOfAdministration",
          "code": "IM",
          "display": "Injection, intramuscular"
        }
      },
      "note": "Protects against diphtheria, tetanus, pertussis (whooping cough), polio, hepatitis B and Haemophilus influenzae type b (Hib).",
      "resourceType": "Immunization"
    }
```

If the date of birth is omitted, a date of birth 3 years ago will be used.
