import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:storeapp/Models/getAllProductsModel.dart';

import '../../Services/getAllProductService.dart';

part 'get_all_products_state.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit() : super(GetAllProductsInitial());

  getAllProductsMethod() async {
    emit(GetAllProductsLoading());
    try {
      List<GetAllProductsModel> products =
          await GetAllProductsService().getAllProducts();
      emit(GetAllProductsSuccess(products: products));
    } on Exception catch (e) {
      emit(GetAllProductsFailure());
    }
  }
}
