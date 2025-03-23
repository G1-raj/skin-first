import mongoose from "mongoose";
import Appointment from "./appontment.model.js";

const doctorSchema = new mongoose.Schema(
    {
        name: {
            type: String,
            required: true,
        },

        email: {
            type: String,
            required: true,
            unique: true
        },

        title: {
            type: String,
            required: true
        },

        yearsOfExperience: {
            type: Number,
            required: true
        },

        highestDegree: {
            type: String,
            enum: ["Bachelors", "MD", "MS"],
            required: true
        },

        specialization: {
            type: String,
            required: true
        },

        profile: {
            type: String,
            required: true
        },

        highlight: {
            type: String,
            required: true
        },

        appointments: [
            {
                type: mongoose.Schema.Types.ObjectId,
                ref: "Appointment" 
            }
        ]
    }, {timestamps: true}
);

const Doctor = mongoose.model("Doctor", doctorSchema);

export default Doctor;