import 'package:food/ui_export.dart';

@immutable
abstract class DetailInfoEvent {
  const DetailInfoEvent();
}

@immutable
class GetDetailInfo implements DetailInfoEvent {
  final String idMeal;

  const GetDetailInfo(this.idMeal);
}