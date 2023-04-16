import 'package:darts_link_project/models/city.dart';
import 'package:darts_link_project/models/pref.dart';
import 'package:darts_link_project/views/sort_page/components/sort_page_selector_frame.dart';
import 'package:flutter/material.dart';

import 'area_selector_input_view.dart';

class AreaSelectorView extends StatelessWidget {
  const AreaSelectorView({
    Key? key,
    required this.onSubmitPrefSelector,
    required this.onSubmitCitySelector,
    this.selectedPref,
    this.selectedCity,
  }) : super(key: key);
  final Pref? selectedPref;
  final City? selectedCity;
  final ValueChanged<Pref> onSubmitPrefSelector;
  final ValueChanged<City> onSubmitCitySelector;

  @override
  Widget build(BuildContext context) {
    Pref? cachePref;
    City? cacheCity;
    return SortPageSelectorFrame(
      title: '場所',
      children: [
        AreaSelectorInputView<Pref>(
          title: '都道府県',
          value: selectedPref?.name,
          onChanged: (Pref pref) => cachePref = pref,
          onSubmitted: () {
            if (cachePref == null) return;
            onSubmitPrefSelector.call(cachePref!);
          },
        ),
        const SizedBox(height: 24),
        AreaSelectorInputView<City>(
          title: 'エリア',
          value: selectedCity?.name,
          selectedPref: selectedPref,
          onChanged: (City city) => cacheCity = city,
          onSubmitted: () {
            if (cacheCity == null) return;
            onSubmitCitySelector.call(cacheCity!);
          },
        ),
      ],
    );
  }
}
