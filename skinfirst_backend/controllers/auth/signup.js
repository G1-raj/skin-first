import User from "../../models/user.model.js";
import bcrypt from 'bcrypt';

const signup = async (req, res) => {

    try {

        const {fullName, email, phoneNo, password} = req.body;

        if(!fullName || !email || !phoneNo || !password) {
            return res.status(400).json(
                {
                    success: false,
                    message: "All fields are required"
                }
            );
        }

        const userExists = await User.findOne({email});

        if(userExists) {
            return res.status(400).json(
                {
                    success: false,
                    message: "User already exists"
                }
            );
        }

        const hashedPassword = await bcrypt.hash(password, 10);

        const user = await User.create({
            fullName,
            email,
            phoneNo,
            password: hashedPassword
        });

        res.status(200).json(
            {
                success: true,
                data: user,
                message: "User created successfully"
            }
        );
        
    } catch (error) {

        console.log(`Error is: ${error}`);
        res.status(500).json(
            {
                success: false,
                message: "Internal server error"
            }
        );
    }

}

export default signup;