import User from "../../models/user.model.js";
import bcrypt from 'bcrypt';
import jwt from "jsonwebtoken";
import { configDotenv } from "dotenv";

configDotenv();

const login = async (req, res) => {
    try {

        const {email, password} = req.body;

        if(!email || !password) {
            return res.status(400).json(
                {
                    success: false,
                    message: "All fields are required"
                }
            );
        }

        const existingUser = await User.findOne({email});

        if(!existingUser) {
            return res.status(404).json(
                {
                    success: false,
                    message: "User does not exist"
                }
            );
        }

        let jwt_secret = process.env.JWT_SECRET_KEY;
        const payload = {
            email: existingUser.email,
            id: existingUser._id,
        }

        const validPassword = await bcrypt.compare(password, existingUser.password);

        if(!validPassword) {
            return res.status(401).json(
                {
                    success: false,
                    message: "Invalid password"
                }
            );
        }

        const token = jwt.sign(payload, jwt_secret, {expiresIn: '2h'});
        existingUser.token = token;
        existingUser.password = undefined;

        const options = {
            expires: new Date(Date.now() + 3 * 24 * 60 * 60 *1000),
            httpOnly: true
        };

        res.cookie('token', token, options).status(200).json({
            success: true,
            data: existingUser,
            token: token,
            message: "Login successful",
        });
        
    } catch (error) {
        res.status(500).json(
            {
                success: false,
                message: "Internal server error"
            }
        );
    }
}

export default login;