import User from "../../models/user.model.js";
import Appointment from "../../models/appontment.model.js";

const getCancelledAppointment = async (req, res) => {
    try {

        const { patientId } = req.params;

        let cancelledAppointments = await Appointment.find(
            {
                patientId: patientId,
                isCancelled: true
            }
        );

        if(cancelledAppointments.length === 0) {
            return res.status(404).json(
                {
                    success: false,
                    message: "No cancelled appointmants",
                }
            );
        }

        res.status(200).json({
            success: true,
            data: cancelledAppointments,
            message: "All cancelled appointment fetched successfully"
        });
    } catch (error) {
        console.log(`Error is: ${error}`);
        res.status(500).json(
            {
                success: false,
                message: "Internal server error"
            }
        );
    }
}

export default getCancelledAppointment;