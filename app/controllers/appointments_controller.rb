class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end
  
  def new
    #we are setting @doctors and @patients to map out as an 
    #array so that we can select from the list of doctors and
    #patients in our new appointment form

    @doctors = Doctor.all.map { |d| [d.name, d.id] }
    @patients = Patient.all.map { |p| [p.name, p.id] }
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
      if @appointment.save
        redirect_to doctors_path
      else
        render :new
      end
  end

  def destroy
    doctor = Doctor.find(params[:doctor_id])
    appointment = Appointment.find(params[:id])
    appointment.destroy
    redirect_to doctor_path(doctor)
  end

private
  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_id, :date)
  end
end
