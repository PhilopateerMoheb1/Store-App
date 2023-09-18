import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'update_products_state.dart';

class UpdateProductsCubit extends Cubit<UpdateProductsState> {
  UpdateProductsCubit() : super(UpdateProductsInitial());
}
