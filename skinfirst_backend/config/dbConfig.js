import mongoose from "mongoose";
import { configDotenv } from "dotenv";

configDotenv();

const dbConnect = async () => {
    try {

        let url = process.env.DATABASE_URL;

        await mongoose.connect(url);
        console.log("Connected to database successfully");
        
    } catch (error) {
        console.log(`Error in connecting to database and error is: ${error}`);
        throw `Error in connecting to database and error is: ${error}`;
    }
}

export default dbConnect;