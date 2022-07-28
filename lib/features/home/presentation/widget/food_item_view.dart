import 'package:food/core/navigator.dart';
import 'package:food/features/detail/presentation/screen/detail_info_page.dart';
import 'package:food/features/home/data/model/food_model.dart';

import '../../../../ui_export.dart';

class FoodItemView extends StatelessWidget {
  const FoodItemView({Key? key, required this.listFood}) : super(key: key);

  final List<FoodModel> listFood;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: listFood.length,
      separatorBuilder: (context, index) => Container(
        height: 0.5,
        color: Colors.grey,
      ),
      itemBuilder: (context, index) {
        final meal = listFood[index];
        return MaterialButton(
          onPressed: () {
            push(context, DetailInfoPage(idMeal: meal.idMeal));
          },
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                meal.mealThumb,
                loadingBuilder: (context, child, loadingProgress) {
                  return Center(
                    child: child,
                  );
                },
                frameBuilder: (context, child, index, _) {
                  return Container(child: child);
                },
                height: 52,
                width: 52,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  meal.meal,
                  style: const TextStyle(fontSize: 16),
                ),
              ))
            ],
          ),
        );
      },
    );
  }
}
