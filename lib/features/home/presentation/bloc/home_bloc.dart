import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/home/data/model/category_model.dart';
import 'package:food/features/home/data/model/food_model.dart';
import 'package:food/features/home/domain/usecase/get_food_by_category.dart';
import 'package:food/features/home/domain/usecase/get_list_category.dart';
import 'package:food/ui_export.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetListCategory _getListCategory;
  final GetFoodByCategory _getFoodByCategory;

  HomeBloc(this._getListCategory, this._getFoodByCategory)
      : super(HomeState()) {
    on<HomeEventGetCategory>(
        (HomeEventGetCategory event, Emitter<HomeState> emit) async {
      await loadCategory(emit);
    });
    on<HomeEventGetFood>(
        (HomeEventGetFood event, Emitter<HomeState> emit) async {
      await getFood(event, emit);
    });
  }

  /// Func fetch list load category
  Future loadCategory(Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    // do process request list category from usecase
    final result = await _getListCategory(NoParams());
    result.when(ok: (data) {
      emit(state.copyWith(isLoading: false, listCategory: data));
    }, err: (err) {
      emit(state.copyWith(isLoading: false, listCategory: []));
    });
  }

  /// Func fetch list food based on category
  Future getFood(HomeEventGetFood event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    // do process request list for from usecase
    final result = await _getFoodByCategory(event.category);
    result.when(ok: (data) {
      emit(state.copyWith(isLoading: false, listFood: data));
    }, err: (err) {
      emit(state.copyWith(isLoading: false, listFood: []));
    });
  }
}
