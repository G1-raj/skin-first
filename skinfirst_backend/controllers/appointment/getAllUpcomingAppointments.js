import Appointment from "../../models/appontment.model.js";

const getAllUpcomingAppointment = async (req, res) => {

    try {

        const { patientId } = req.params;

        const getAllUpcomingAppointment = await Appointment.find(
            {
                patientId: patientId,
                isCancelled: false,
                isPending: true
            }
        );

        res.status(200).json(
            {
                success: true,
                data: getAllUpcomingAppointment,
                message: "All upcoming appointment fetched successfully"
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

export default getAllUpcomingAppointment;