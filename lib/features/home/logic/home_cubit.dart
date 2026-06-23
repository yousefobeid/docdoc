import 'package:bloc/bloc.dart';
import 'package:docdoc/core/helpers/extension.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/home/data/model/doctors_info_model.dart';
import 'package:docdoc/features/home/data/model/specialization_data_model.dart';
import 'package:docdoc/features/home/repo/home_repo.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  List<SpecializationData?>? specializationDataList = [];
  HomeCubit(this._homeRepo) : super(HomeState.initial());
  void getSpecialization() async {
    emit(HomeState.specializationLoading());
    final result = await _homeRepo.getSpecialization();
    result.when(
      success: (specializationResponseModel) {
        specializationDataList =
            specializationResponseModel.specializationDataList ?? [];
          getDoctorsList(specializationId: specializationDataList?.first?.id );
        emit(
          HomeState.specializationSuccess(
            specializationResponseModel.specializationDataList,
          ),
        );
      },
      failure: (error) {
        emit(HomeState.specializationFailure(error));
      },
    );
  }

  void getDoctorsList({required int? specializationId}) {
    List<Doctors?>? doctorsList = getDoctorsListBySpecializationId(
      specializationId,
    );
    if (!doctorsList.isNullOrEmpty()) {
      emit(HomeState.doctorsSuccess(doctorsList));
    } else {
      emit(HomeState.doctorsFailure('No Doctors Found'));
    }
  }

  List<Doctors?>? getDoctorsListBySpecializationId(specializationId) {
    return specializationDataList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}
