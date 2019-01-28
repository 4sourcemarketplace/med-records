require 'pry'
class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
def new
  @patient = Patient.new
  @med_order = MedOrder.new
  @admission = Admission.new
  @order_freq = OrderFreq.new
  @facilities = Facility.all
end
def age(dob)
  now = Time.now.utc.to_date
  now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
end

def show
@patient = Patient.find_by(id: params[:id])
@facility_name = Facility.find_by(id: @patient.facility_id + 1).name
@patient_age = age(@patient.dob)
@first_name = @patient.first_name
@last_name =  @patient.middle_name
@middle_name =  @patient.last_name
@medical_record = @patient.mr
@patient_gender = @patient.gender
@patient_admission_date = Admission.find_by(patient_id:params[:id]).moment.to_date
@patient_admission_time = DateTime.now.strftime("%I:%M %p")
@patient_admission_diagnoses = Diagnosis.find_by(patient_id: params[:id]).description
@patient_admission_symptoms_description = Symptom.find_by(admission_id: params[:id]).description
@patient_admission_observations_description = Observation.find_by(admission_id: params[:id]).description
@patient_allergies_description = Allergy.find_by(patient_id: params[:id]).description
@patient_chronic_conditions_description = Diagnosis.find_by(patient_id: params[:id]).description
@patient_medications_names =  MedOrder.find_by(patient_id:params[:id]).name
@patient_medications_dosage1 = MedOrder.find_by(patient_id: params[:id]).dosage
@patient_medications_dosage2 = MedOrder.find_by(patient_id: params[:id]).dosage2
@patient_medications_dosage3 = MedOrder.find_by(patient_id: params[:id]).dosage3
@patient_medications_dosage4= MedOrder.find_by(patient_id: params[:id]).dosage4
@patient_medications_dosage5= MedOrder.find_by(patient_id: params[:id]).dosage5
@patient_medications_route = MedOrder.find_by(patient_id: params[:id]).route
@unit = MedOrder.find_by(patient_id: params[:id]).unit
@patient_medications_frequency = OrderFreq.find_by(med_order_id: params[:id]).value
@patient_treatment_necessity = Treatment.find_by(patient_id: params[:id]).necessity

@patient_diagnostic_procedures_description = DiagProc.find_by(patient_id: params[:id]).description
@patient_diagnostic_procedures_moment = DiagProc.find_by(patient_id: params[:id]).moment
@patient_diagnosis_description = Diagnosis.find_by(patient_id: params[:id]).description
@patient_treatments_description = Treatment.find_by(patient_id: params[:id]).description
@patient_treatments_necessity =Treatment.find_by(patient_id: params[:id]).necessity
end

def create
    # PATIENT SECTION
  @patient = Patient.new(patient_params)
  @patient[:facility_id] = params[:patient][:facility_id]
  @patient.save

  # MEDICATIONS SECTION
  @med_order = @patient.med_orders.new(
    dosage: params[:patient][:med_orders][:dosage],
    frequency: params[:patient][:med_orders][:frequency],
    patient_id: @patient.id,
    name: params[:patient][:med_orders][:name]
  )
    # DOSAGE SECTION
  @med_order[:dosage2] = params[:patient][:med_orders][:dosage2]
  @med_order[:dosage3] = params[:patient][:med_orders][:dosage3]
  @med_order[:dosage4] = params[:patient][:med_orders][:dosage4]
  @med_order[:dosage5] = params[:patient][:med_orders][:dosage5]
  @med_order.save
  @patient[:medications] = @med_order

    # MEDICATION ORDER FREQUENCIES SECTION
  @med_order.order_freqs
  order_frequency = @med_order.order_freqs.new(
    med_order_id: @med_order.id,
    value: params[:patient][:order_freqs][:value],
    freq_unit: params[:freq_unit].keys.join('')
  )
  @med_order[:frequency] = order_frequency
  order_frequency.save


    # ADMISSIONS SECTION
  @patient.admissions
  @admission = @patient.admissions.new(patient_id: @patient.id, moment: params[:patient][:admissions][:moment])
  @patient[:admissions] = @admission
  @admission.save
  @patient.save
  #ADMISSION SYMPTOMS SECTION
@admission.symptoms
symptom = @admission.symptoms.new(admission_id: @admission.id, description: params[:patient][:admissions][:symptoms][:description])
symptom.save
@admission[:symptoms] = symptom
@admission.save

#ADMISSION OBSERVATIONS SECTION
@admission.observations
observation = @admission.observations.new(admission_id: @admission.id)
observation[:description] = params[:patient][:admissions][:observations][:description]
observation[:moment] = params[:patient][:admissions][:observations][:moment]
@admission[:observations] = observation
@admission[:moment] = observation[:moment]
observation.save
@admission.save

    # ALLERGIES SECTION
  @patient.allergies
  allergy = @patient.allergies.new(patient_id: @patient.id,description: params[:patient][:allergies][:description])
  allergy.save
  @patient[:allergies] = allergy

  # DIAGNOSES SECTION
  @patient.diagnoses
  diagnosis = @patient.diagnoses.new(
  patient_id: @patient.id,
  description: params[:patient][:diagnoses][:description],
  coding_systen: params[:patient][:diagnoses][:coding_systen],
  code: params[:patient][:diagnoses][:code])
  diagnosis.save
  @patient[:diagnoses] = diagnosis
  @patient[:chron_conds] = diagnosis


    # GENDER SECTION
  @keys = params[:gender].values
  @values = params[:gender].keys
  key = @keys.index("1")
  value = @values[key]
  @patient[:gender] = value
  @patient.save

    # TREATMENT SECTION
  @patient.treatments
  treatment = @patient.treatments.new(patient_id: @patient.id,description: params[:patient][:treatments][:description],necessity:params[:patient][:treatments][:necessity])
  treatment.save
  @patient[:treatments] = treatment


  # DIAGNOSTIC PROCEDURE SECTION
  @patient.diag_procs
  diag_proc = @patient.diag_procs.new(patient_id: @patient.id,description: params[:patient][:diag_procs][:description],moment:params[:patient][:diag_procs][:moment])
  diag_proc.save
  @patient[:diag_procs] = diag_proc

    # MEDICATIONS UNITS SECTION
  MedOrder.mass_units.each do |xy|
      @unit = xy[0]
      @med_order[:unit] = @unit
      @med_order.save
  end
    # MEDICATIONS ROUTES
  MedOrder.medication_routes.each do |xy|
    if xy[1] == params[:route]["r"].to_i
      @route = xy[0]
      @med_order[:route] = @route
      @med_order.save
  end
end

  # DATE OF BIRTH SECTION SECTION
  @patient[:dob] = params[:patient][:dob]
# FINAL SECTION
  @admission[:diagnoses] = diagnosis
  @admission.save
  @patient.save


respond_to do |format|
  if @patient.save
    format.html { redirect_to @patient, notice: 'Patient was successfully Uploaded.' }
    format.json { render :show, status: :created, location: @patient }
  else
    format.html { render :new }
    format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end





def update
  respond_to do |format|
    if @patient.update(patient_params)
      format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
      format.json { render :show, status: :ok, location: @patient }
    else
      format.html { render :edit }
      format.json { render json: @patient.errors, status: :unprocessable_entity }
    end
  end
end




private


  def set_patient
    @patient = Patient.find(params[:id])
  end


  def patient_params
    params.require(:patient).permit(:first_name, :middle_name, :last_name, :dob, :mr, :admissions, :allergies, :med_orders, :order_freqs, :diagnoses, :treatments, :diag_procs,:facility_id)
  end

end
