// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food/common/constant.dart';
import 'package:food/core/injections/config_dependencies.dart';
import 'package:food/features/detail/data/repo/detail_repo_impl.dart';
import 'package:food/features/detail/domain/repo/detail_repo.dart';
import 'package:food/features/home/data/model/category_model.dart';
import 'package:food/features/home/data/repo/home_repo_impl.dart';
import 'package:food/features/home/domain/repo/home_repo.dart';
import 'package:food/features/home/domain/usecase/get_food_by_category.dart';
import 'package:food/features/home/domain/usecase/get_list_category.dart';
import 'package:food/features/home/presentation/bloc/home_bloc.dart';

import 'package:food/main.dart';
import 'package:mocktail/mocktail.dart';

class MockCategory extends MockBloc<HomeEvent, HomeState> implements HomeBloc {}

class HomeEventFake extends Fake implements HomeEvent {}

class HomeStateFake extends Fake implements HomeState {}

void main() {
  late HomeBloc homeBloc;
  late Dio dio;
  late GetListCategory getListCategory;
  late GetFoodByCategory getFoodByCategory;
  late HomeRepo homeRepo;
  late DetailRepo detailRepo;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
    homeRepo = HomeRepoImpl(dio);
    detailRepo = DetailRepoImpl(dio);
    getListCategory = GetListCategory(homeRepo);
    getFoodByCategory = GetFoodByCategory(homeRepo);
    homeBloc = HomeBloc(getListCategory, getFoodByCategory);
    // homeBloc = getIt<HomeBloc>();
  });
  group('get category', () {
    test("request list category", () async {
      final expectResult = ['Beef', 'Breakfast', 'Chicken'];
      final result = await homeRepo.getListCategory();
      final sortResult = result
          .where((element) => expectResult.contains(element.category))
          .map((e) => e.category)
          .toList();
      expect(expectResult, sortResult);
    });
  });
  group('get food category', () {
    test('request list food category', () async {
      final expectResult = [
        'Chilli prawn linguine',
        'Fettucine alfredo',
        'Grilled Mac and Cheese Sandwich'
      ];
      final result = await homeRepo.getFoodByCategory('Pasta');
      final sortResult = result
          .where((element) => expectResult.contains(element.meal))
          .map((e) => e.meal)
          .toList();
      expect(expectResult, sortResult);
    });
  });
  group('get detail food', () {
    test('request detail food', () async {
      final result = await detailRepo.getDetailInfo('52839');
      expect('Chilli prawn linguine', result.strMeal);
    });
  });
  // group("Find widget Category", () {});
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());
  //
  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);
  //
  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();
  //
  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
}
