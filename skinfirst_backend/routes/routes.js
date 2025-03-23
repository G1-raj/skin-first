import express from 'express';
import login from '../controllers/auth/login.js';
import signup from '../controllers/auth/signup.js';
import addDoctor from '../controllers/doctors/addDoctor.js';
import getAllDoctors from '../controllers/doctors/getAllDoctors.js';
import getADoctor from '../controllers/doctors/getADoctor.js';
import makeAppointment from '../controllers/appointment/makeAppointment.js';
import getUpcomingAppointment from '../controllers/appointment/getUpcomingAppointment.js';
import uploadProfile from '../controllers/profilePicture/upload_profile_picture.js';
import getCancelledAppointment from '../controllers/appointment/getCancelledAppointments.js';
import getAllUpcomingAppointment from '../controllers/appointment/getAllUpcomingAppointments.js';
import cancelAppointment from '../controllers/appointment/cancelAppointment.js';

const router = express.Router();

router.post("/user/login", login);
router.post("/user/signup", signup);
router.post("/user/doctor/add", addDoctor);
router.get("/user/doctor/getall", getAllDoctors);
router.get("/user/doctor/getdoctor/:id", getADoctor);
router.post("/user/appointment/:patientId/:doctorId", makeAppointment);
router.get("/user/appointment/getlatest/:patientId", getUpcomingAppointment);
router.patch("/user/update/addprofile/:patientId", uploadProfile);
router.get("/user/appointment/cancelled/:patientId", getCancelledAppointment);
router.get("/user/appointment/allupcoming/:patientId", getAllUpcomingAppointment);
router.patch("/user/appointment/cancel/:appointmentId", cancelAppointment);


export default router;