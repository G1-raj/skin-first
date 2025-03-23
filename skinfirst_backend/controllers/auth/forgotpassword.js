import User from "../../models/user.model.js";

const forgotPassword = async (req, res) => {

    try {
        
    } catch (error) {
        res.status(500).json(
            {
                success: false,
                message: "Internal server error"
            }
        );
    }

}

export default forgotPassword;