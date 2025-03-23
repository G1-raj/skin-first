import Doctor from "../../models/doctor.model.js";

const getAllDoctors = async (req, res) => {
    try {

        let doctors = await Doctor.find();

        res.status(200).json(
            {
                success: true,
                data: doctors,
                message: "Fetched all Doctor's successfully"
            }
        );
        
    } catch (error) {
        console.log(`adding doctor Error is: ${error}`);
        res.status(500).json(
            {
                success: false,
                message: "Internal server error"
            }
        );
    }
}

export default getAllDoctors;