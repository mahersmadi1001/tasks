import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:test_packegs/core/constants/api_constants.dart';
import 'package:test_packegs/models/product_model.dart';
import 'package:test_packegs/services/product_service.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductService productService;
  ProductBloc({required this.productService}) : super(ProductState()) {
    on<GetAllProducts>((event, emit) async {
      if (!state.hasReachedMax) {
        emit(
          state.copyWith(
            productStatus: ProductStatus.loading,
            errorMessage: null,
          ),
        );
        List<ProductModel>? result = await productService.getAllProducts(
          skip: state.products.length,
        );
        if (result != null) {
          emit(
            state.copyWith(
              products: [...state.products, ...result],
              productStatus: ProductStatus.success,
              hasReachedMax: result.length < ApiConstants.limit,
              errorMessage: null,
            ),
          );
        } else {
          emit(
            state.copyWith(
              productStatus: ProductStatus.failure,
              errorMessage: "failed to load data",
            ),
          );
        }
      }
    });
  }
}
