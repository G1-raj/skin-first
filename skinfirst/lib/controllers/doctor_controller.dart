import 'package:get/get.dart';
import 'package:skinfirst/models/doctor_model.dart';
import 'package:skinfirst/services/doctor_service.dart';

class DoctorController extends GetxController{

  RxInt noOfDoctors = 0.obs;
  RxList<DoctorModel> allDoctors = RxList<DoctorModel>();
  var doctorDetails = Rxn<DoctorModel>();

  @override
  void onInit() {
    super.onInit();

    getAllDoctorsController();
  }



  Future<void> getAllDoctorsController() async {
    try {

      var result = await DoctorService().getAllDoctorsService();

      if(!result.isSuccess) {
        Get.snackbar("Error", result.errorResponse!.message);
        return;
      }

      noOfDoctors.value = result.allDoctorResponse!.data.length;
      allDoctors.value = result.allDoctorResponse!.data;
      
    } catch (e) {
      throw Exception("Failed to fetch all the doctors detail and error is in controler error is: $e");
    }
  }

  Future<void> getADoctorDetailController(String doctorId) async {
    try {

      var result = await DoctorService().getADoctorService(doctorId);

      if(!result.isSuccess) {
        Get.snackbar("Error", result.errorResponse!.message);
        return;
      }

      doctorDetails.value = result.doctorResponse!.data;
      
    } catch (e) {
      throw Exception("Failed to fetch the  doctor detail and error is in controler error is: $e");
    }
  }
}