import express from "express";
import { configDotenv } from "dotenv";
import dbConnect from "./config/dbConfig.js";
import router from "./routes/routes.js";
import cookieParser from "cookie-parser";
import fileUpload from "express-fileupload";
import cloudinaryConnect from "./config/cloudinaryConfig.js";

configDotenv();

const app = express();
const port = process.env.PORT || 4000;

app.use(express.json()); 
app.use(cookieParser());
app.use(fileUpload({
   useTempFiles: true,
   temFileDir: '/temp/'
}));
app.use("/api/v1", router);
dbConnect();
cloudinaryConnect();

app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});

app.get("/", (req, res) => {
  res.send("Skin first!");
});

export default app;