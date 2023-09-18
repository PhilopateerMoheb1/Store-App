part of 'get_all_products_cubit.dart';

@immutable
sealed class GetAllProductsState {}

final class GetAllProductsInitial extends GetAllProductsState {}

final class GetAllProductsLoading extends GetAllProductsState {}

final class GetAllProductsFailure extends GetAllProductsState {}

final class GetAllProductsSuccess extends GetAllProductsState {
  List<GetAllProductsModel> products;
  GetAllProductsSuccess({required this.products});
}
