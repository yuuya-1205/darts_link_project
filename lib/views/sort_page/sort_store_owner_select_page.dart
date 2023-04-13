import 'package:darts_link_project/components/original_button.dart';
import 'package:darts_link_project/models/city.dart';
import 'package:darts_link_project/models/pref.dart';
import 'package:darts_link_project/models/sort_state.dart';
import 'package:darts_link_project/views/components/app_bar_back_view.dart';
import 'package:flutter/material.dart';

import 'components/area_selector_view.dart';

class SortStoreOwnerSelectPage extends StatefulWidget {
  const SortStoreOwnerSelectPage({Key? key}) : super(key: key);

  @override
  State<SortStoreOwnerSelectPage> createState() =>
      _SortStoreOwnerSelectPageState();
}

class _SortStoreOwnerSelectPageState extends State<SortStoreOwnerSelectPage> {
  Pref? selectedPref;
  City? selectedCity;

  void closePicker() => Navigator.pop(context);

  void submitPrefSelector(Pref pref) {
    setState(() {
      selectedPref = pref;
    });
    closePicker();
  }

  void submitCitySelector(City city) {
    setState(() {
      selectedCity = city;
    });
    closePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 76,
        title: const Text('ダーツバーの絞り込み'),
        leading: const AppBarBackView(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),
              AreaSelectorView(
                selectedPref: selectedPref,
                selectedCity: selectedCity,
                onSubmitPrefSelector: submitPrefSelector,
                onSubmitCitySelector: submitCitySelector,
              ),
              const SizedBox(height: 32),
              const Spacer(),
              OriginalButton(
                text: '絞り込み検索する',
                onPressed: () {
                  if (selectedPref == null && selectedCity == null) {
                    Navigator.pop(context);
                    return;
                  }

                  final sortState = SortState(
                    pref: selectedPref,
                    city: selectedCity,
                  );
                  Navigator.pop(context, sortState);
                },
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
