import User from "../../models/user.model.js";
import Appointment from "../../models/appontment.model.js";
import Doctor from "../../models/doctor.model.js";

const getAlldoctors = async (req, res) => {

    try {

        const { patientId } = req.params;
        
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

export default getAlldoctors;