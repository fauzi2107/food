import '../ui_export.dart';

Future<dynamic> push(BuildContext context, Widget route) async {
  return await Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => route));
}

pop(BuildContext context, {List<dynamic>? result}) {
  Navigator.of(context).pop(result);
}
