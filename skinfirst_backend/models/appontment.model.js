import mongoose from "mongoose";

const appointmentSchema = new mongoose.Schema(
    {
        patientId: {
            type: mongoose.Types.ObjectId,
            ref: "User",
            required: true
        },

        doctorId: {
            type: mongoose.Types.ObjectId,
            ref: "Doctor",
            required: true,
        },

        appointmentDate: {
            type: Date,
            required: true,
        },

        appointmentTime: {
            type: String,
            required: true,
            trim: true,
            match: /^([0-9]{1,2}):([0-9]{2}) (AM|PM)$/  // Ensures "HH:mm AM/PM" format
        },

        patientDetails: {
            type: String,
            enum: ["Yourself", "Another Person"],
            required: true
        },

        patientName: {
            type: String,
            required: true
        },

        patientAge: {
            type: Number,
            required: true
        },

        patientGender: {
            type: String,
            enum: ["Male", "Female", "Other"],
            required: true
        },

        problemDescription: {
            type: String,
            required: true
        },

        isPending: {
            type: Boolean,
            default: true
        },

        isCancelled: {
            type: Boolean,
            default: false
        }

    }, {timestamps: true}
);

const Appointment = mongoose.model("Appointment", appointmentSchema);
export default Appointment;