class AppointmentsController < ApplicationController
  def new
    #we are setting @doctors and @patients to map out as an 
    #array so that we can select from the list of doctors and
    #patients in our new appointment form
    @doctors = Doctor.all.map{ |d| [d.name, d.id]}
    @patients = Patient.all.map{ |p| [p.name, p.id]}
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
      if @appointment.save
        redirect_to :back
      else
        render :new
      end
  end

  def destroy
    appointment = Appointment.find(params[:id])
    appointment.destroy
    redirect_to :back
  end

private
  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_id, :date)
  end
end
