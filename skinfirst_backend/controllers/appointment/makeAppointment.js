import Doctor from "../../models/doctor.model.js";
import User from "../../models/user.model.js";
import Appointment from "../../models/appontment.model.js";
import mongoose from "mongoose";

const makeAppointment = async (req, res) => {
    try {

        const { doctorId, patientId } = req.params;
        const { appointmentDate, appointmentTime, patientDetails, patientName, patientAge, patientGender, problemDescription } = req.body;

        if(
            !patientId || !doctorId || !appointmentDate || !appointmentTime || !patientDetails || !patientName ||  !patientAge || !patientGender || !problemDescription) {
                return res.status(400).json(
                    {
                        success: false,
                        message: "All fields are required"
                    }
                );
            }

        let doctorExist = await Doctor.findById(doctorId);
        let patientExist = await User.findById(patientId);

        if(!doctorExist) {
            return res.status(404).json(
                {
                    success: false,
                    message: "Doctor does not exist"
                }
            );
        }

        if(!patientExist) {
            return res.status(404).json(
                {
                    success: false,
                    message: "Patient does not exist"
                }
            );
        }

        const newAppointment = await Appointment.create({
            doctorId,
            patientId,
            appointmentDate,
            appointmentTime,
            patientDetails,
            patientName,
            patientAge,
            patientGender,
            problemDescription
        });

        res.status(201).json({
            success: true,
            data: newAppointment,
            message: "Appointment created successfully"
        });
        
    } catch (error) {
        console.log(`fail to make appointment Error is: ${error}`);
        res.status(500).json(
            {
                success: false,
                message: "Internal server error"
            }
        );
    }
}

export default makeAppointment;