# README


rails g migration add_gender_to_patients status:integer
rails g migration add_mass_unit_to_medication_order status:integer
rails g migration add_medication_route_to_medication_order status:integer
rails g migration add_frequency_unit_to_order_frequency frequency_unit:integer
rails g migration add_frequency_unit_to_order_frequency frequency_unit:integer
rails g migration add_frequency_unit_to_order_frequency frequency_unit:integer
///
rails g migration CreateJoinTablePatientAdmission patient admission
rails g migration CreateJoinTableMedOrderOrderFreq med_order order_freq
rails g migration CreateJoinTablePatientAllergy patient allergy
rails g migration CreateJoinTablePatientDiagnosis patient diagnosis
rails g migration CreateJoinTablePatientTreatment patient treatment
rails g migration CreateJoinTablePatientDiagnosticProcedure patient diagnostic_procedure
rails g migration CreateJoinTablePatientMedication patient medication
///
rails generate migration AddMedicationsRefToPatients medication:references
//
rails g migration CreateJoinTableMedicationOrderOrderFrequency medication_order order_frequency
//
rails g migration AddPatientToAllergies patient:references
rails g migration AddPatientToDiagnoses patient:references
rails g migration AddPatientToTreatments patient:references
rails g migration AddPatientToAdmissions patient:references
rails g migration AddPatientToDiagProcs patient:references
rails g migration AddPatientToMedOrders patient:references
//
rails g migration AddMedOrderToOrderFreqs med_order:references
rails g migration AddMedOrderToDiagnoses med_order:references

///

rails g migration AddAdmissionToObservations admission:references
rails g migration AddAdmissionToSymptoms admission:references

//
rails g migration AddFacilityToPatients patient:references
