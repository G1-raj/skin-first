import Doctor from "../../models/doctor.model.js";

const addDoctor = async (req, res) => {

    try {

        const {name, email, title, yearsOfExperience, highestDegree, specialization, profile, highlight} = req.body;

        if(!name || !email || !title || !yearsOfExperience || !highestDegree || !specialization || !profile || !highlight) {
            return res.status(400).json(
                {
                    success: false,
                    message: "All fields are required"
                }
            );
        }

        let doctorExist = await Doctor.findOne({email});

        if(doctorExist) {
            return res.status(400).json(
                {
                    success: false,
                    message: "Doctor already exists"
                }
            );
        }

        let doc = await Doctor.create(
            {
                name,
                email,
                title,
                yearsOfExperience,
                highestDegree,
                specialization,
                profile,
                highlight
            }
        );

        res.status(200).json(
            {
                success: true,
                user: doc,
                message: "Doctor created successfully"
            }
        );


        
    } catch (error) {
        res.status(500).json(
            {
                success: false,
                message: "Internal server error"
            }
        );
    }

}

export default addDoctor;