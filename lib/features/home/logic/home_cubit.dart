import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_project/core/helpers/extensions.dart';
import 'package:flutter_complete_project/features/home/data/models/categories_response_model.dart';
import '../../../core/networking/api_error_handler.dart';
import '../data/models/product_response_model.dart';
import '../data/repos/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  int selectedIndex = 0;

  void onItemTapped(int index) {
    emit(HomeState.onItemTapped(index));
      selectedIndex = index;

  }
  HomeCubit(this._homeRepo) : super(const HomeState.initial());

  List<CategoryData?>? categoriesList = [];
  List<ProductData?>? ProductsList = [];

  void getCategories() async {
    emit(const HomeState.specializationsLoading());
    final response = await _homeRepo.getCategory();
    response.when(
      success: (specializationsResponseModel) {
        categoriesList =
            specializationsResponseModel.specializationDataList ?? [];

        // getting the doctors list for the first specialization by default.
        // getProductsList(specializationId: categoriesList?.first?.id);
        getProducts();
        emit(HomeState.specializationsSuccess(
            specializationsResponseModel.specializationDataList));
      },
      failure: (errorHandler) {
        emit(HomeState.specializationsError(errorHandler));
      },
    );
  }
  void getProducts() async {
    emit(const HomeState.specializationsLoading());
    final response = await _homeRepo.getProducts();
    response.when(
      success: (specializationsResponseModel) {
        ProductsList =
            specializationsResponseModel.specializationDataList ?? [];

        // getting the doctors list for the first specialization by default.
        // getProductsList(specializationId: categoriesList?.first?.id);

        emit(HomeState.doctorsSuccess(
            specializationsResponseModel.specializationDataList));
      },
      failure: (errorHandler) {
        emit(HomeState.specializationsError(errorHandler));
      },
    );
  }

  void getProductsList({required int? specializationId}) {
    List<ProductData?>? doctorsList =
        getDoctorsListBySpecializationId(specializationId);

    if (!doctorsList.isNullOrEmpty()) {
      emit(HomeState.doctorsSuccess(doctorsList));
    } else {
      emit(HomeState.doctorsError(ErrorHandler.handle('No doctors found')));
    }
  }

  /// returns the list of doctors based on the specialization id
  getDoctorsListBySpecializationId(specializationId) {
    return categoriesList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}
