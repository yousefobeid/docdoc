import 'package:bloc/bloc.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/features/home/repo/home_repo.dart';

import 'home_state.dart';
class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeState.initial());
  void getSpecialization()async{
    emit(HomeState.specializationLoading());
    final result = await _homeRepo.getSpecialization();
    result.when(
      success: (data){
        emit(HomeState.specializationSuccess(data));
      },
      failure: (error){
        emit(HomeState.specializationFailure(error));
      }
    );
  }
}