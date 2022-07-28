import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/injections/config_dependencies.dart';
import 'package:food/features/detail/presentation/bloc/detail_info_bloc.dart';
import 'package:food/features/detail/presentation/bloc/detail_info_event.dart';
import 'package:food/features/detail/presentation/bloc/detail_info_state.dart';

import '../../../../ui_export.dart';

class DetailInfoPage extends StatelessWidget {
  const DetailInfoPage({Key? key, required this.idMeal}) : super(key: key);

  final String idMeal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Apps'),
      ),
      body: BlocProvider<DetailInfoBloc>(
        create: (_) => getIt<DetailInfoBloc>()..add(GetDetailInfo(idMeal)),
        child: BlocBuilder<DetailInfoBloc, DetailInfoState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            final detail = state.detailFood;
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    detail?.strMealThumb ?? '',
                    loadingBuilder: (context, child, loadingProgress) {
                      return Center(
                        child: child,
                      );
                    },
                    frameBuilder: (context, child, index, _) {
                      return Container(child: child);
                    },
                    height: MediaQuery.of(context).size.height * 0.4,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      detail?.strMeal ?? '',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(21, (index) {
                      if (index == 0) {
                        return const Text(
                          'Ingredients :',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        );
                      }

                      String name =
                          detail?.rawData?['strIngredient$index'] ?? '';
                      String measure =
                          detail?.rawData?['strMeasure$index'] ?? '';

                      if (name.isEmpty) {
                        return const Offstage();
                      }

                      final ingredient = "$index. $name : $measure";
                      return Text(ingredient);
                    }).toList(),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: const Text(
                      'Instruction',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(detail?.strInstructions ?? ''),
                  if ((detail?.strSource ?? '').isNotEmpty) ...{
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: Text('Source : ${detail?.strSource}'),
                    )
                  }
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
