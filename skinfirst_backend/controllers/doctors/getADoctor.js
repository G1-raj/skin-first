import Doctor from "../../models/doctor.model.js";

const getADoctor = async (req, res) => {

    try {

        const {id} = req.params;

        let doctor = await Doctor.findById(id);

        res.status(200).json(
            {
                success: true,
                data: doctor,
                message: "Fetched Doctor successfully"
            }
        );
        
    } catch (error) {
        console.log(`getting single doctor Error is: ${error}`);
        res.status(500).json(
            {
                success: false,
                message: "Internal server error"
            }
        );
    }

}

export default getADoctor;