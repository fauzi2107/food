import 'package:food/features/detail/data/model/detail_meal_model.dart';

class DetailInfoState {

  final bool isLoading;
  final DetailFoodModel? detailFood;

  DetailInfoState({this.isLoading = false, this.detailFood});

  DetailInfoState copyWith({bool? isLoading, DetailFoodModel? detailFood}) {
    return DetailInfoState(detailFood: detailFood ?? this.detailFood, isLoading: isLoading ?? this.isLoading);
  }
}