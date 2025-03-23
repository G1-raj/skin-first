import { v2 as cloudinary } from "cloudinary";

function fileTypeSupported(type, supportedType) {
    return supportedType.includes(type);
}

const imageUpload = async (file) => {
    try {

        const supported = ["jpg", "jpeg", "png"];
        const fileType = file.name.split('.')[1].toLowerCase();

        if(!fileTypeSupported(fileType, supported)) {
            console.log("File type not supported");
        }

        const options = {folder: "threesocials"}

        const response = await cloudinary.uploader.upload(file.tempFilePath, options);

        return {
            secure_url: response.secure_url, 
            public_id: response.public_id
        };

        
    } catch (error) {
        throw new Error(error);
    }
}

export default imageUpload;