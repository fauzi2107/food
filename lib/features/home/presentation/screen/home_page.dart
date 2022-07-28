import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/core/injections/config_dependencies.dart';
import 'package:food/features/home/presentation/bloc/home_bloc.dart';
import 'package:food/features/home/presentation/widget/food_item_view.dart';
import 'package:food/ui_export.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = getIt<HomeBloc>();
    _homeBloc.add(const HomeEventGetCategory());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Apps'),
      ),
      body: BlocProvider(
        create: (_) => _homeBloc,
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.isLoading && state.listCategory.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8)),
                  child: DropdownButtonFormField<String>(
                    items: state.listCategory.map((e) {
                      return DropdownMenuItem(
                        child: Text(e.category),
                        value: e.category,
                      );
                    }).toList(),
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Select Category',
                    ),
                    onChanged: (value) {
                      if (value != null) {
                        _homeBloc.add(HomeEventGetFood(value));
                      }
                    },
                  ),
                ),
                Expanded(
                  child: state.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : FoodItemView(listFood: state.listFood),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
