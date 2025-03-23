import User from "../../models/user.model.js";
import Appointment from "../../models/appontment.model.js";

const getUpcomingAppointment = async (req, res) => {
    try {

        const {patientId} = req.params;

        const upcomingAppointment = await Appointment.findOne({
            patientId,
            isCancelled: false,
            isPending: true,
            appointmentDate: { $gte: new Date() } 
        })
        .sort({ appointmentDate: 1 }) 
        .populate("doctorId", "name email phoneNo") 
        .lean();

        if (!upcomingAppointment) {
            return res.status(404).json({
                success: false,
                message: "No upcoming appointments found",
            });
        }

        res.status(200).json({
            success: true,
            data: upcomingAppointment,
            message: "Appointment fetched successfully"
        });
        
    } catch (error) {
        res.status(500).json(
            {
                success: false,
                message: "Internal server error"
            }
        );
    }
}

export default getUpcomingAppointment;