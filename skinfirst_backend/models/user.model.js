import mongoose from "mongoose";
import Appointment from "./appontment.model.js";

const userSchema = new mongoose.Schema(
    {
        fullName: {
            type: String,
            required: true,
            min: 6,
            max: 255,
        },

        email: {
            type: String,
            required: true,
            unique: true,
            min: 6,
            max: 255
        },

        profilePicture: {
            type: String
        },

        profilePictureImageId: {
            type: String
        },

        phoneNo: {
            type: String,
            required: true,
            min: 10,
            max: 20,
            unique: true
        },

        password: {
            type: String,
            required: true,
            min: 6,
            max: 1024
        },

        myappointments: [
            {
                type: mongoose.Schema.Types.ObjectId,
                ref: "Appointment"
            }
        ]

    }, {timestamps: true}
);

const User = mongoose.model("User", userSchema);
export default User;