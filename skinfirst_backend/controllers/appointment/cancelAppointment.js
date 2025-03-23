import Appointment from "../../models/appontment.model.js";
import User from "../../models/user.model.js";

const cancelAppointment = async (req, res) => {

    try {

        const { appointmentId } = req.params;

        const cancelAppointment = await Appointment.findByIdAndUpdate(
            appointmentId,
            {
                isPending: false,
                isCancelled: true
            },
            {new: true}
        );

        res.status(200).json(
            {
                success: true,
                data: cancelAppointment,
                message: "Appointment cancelled successfully"
            }
        );
        
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

export default cancelAppointment;