import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/features/detail/domain/usecase/get_detail_info_food.dart';
import 'package:food/features/detail/presentation/bloc/detail_info_event.dart';
import 'package:food/features/detail/presentation/bloc/detail_info_state.dart';
import 'package:food/ui_export.dart';

@injectable
class DetailInfoBloc extends Bloc<DetailInfoEvent, DetailInfoState> {
  final GetDetailInfoFood _getDetailInfoFood;

  DetailInfoBloc(this._getDetailInfoFood) : super(DetailInfoState()) {
    on<GetDetailInfo>((GetDetailInfo event, Emitter<DetailInfoState> emit) async {
      await _getDetailInfo(event.idMeal, emit);
    });
  }

  Future _getDetailInfo(String id, Emitter<DetailInfoState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _getDetailInfoFood(id);
    result.when(ok: (data) {
      emit(state.copyWith(isLoading: false, detailFood: data));
    }, err: (err) {
      emit(DetailInfoState());
    });
  }

}