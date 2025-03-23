import imageUpload from "../fileUpload/file_upload.js";
import User from "../../models/user.model.js";

const uploadProfile = async (req, res) => {
    try {

        const { patientId } = req.params;

        let profilePicture = null;
        let profileImageId = null;

        if(req.files && req.files.profilePicture) {
            var metadata = await imageUpload(req.files.profilePicture);
            profilePicture = metadata.secure_url;
            profileImageId = metadata.public_id;
        }

       const updatedUser = await User.findByIdAndUpdate(
        patientId,
        {
            profilePicture: profilePicture,
            profilePictureImageId: profileImageId
        },
        {new: true}
       );

        res.status(200).json(
            {
                success: true,
                data: updatedUser,
                message: "Post created successfully"
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

export default uploadProfile;