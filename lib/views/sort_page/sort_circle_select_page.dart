import 'package:darts_link_project/components/original_button.dart';
import 'package:darts_link_project/models/city.dart';
import 'package:darts_link_project/models/pref.dart';
import 'package:darts_link_project/models/sort_state.dart';
import 'package:darts_link_project/models/tag_type.dart';
import 'package:darts_link_project/views/components/original_app_bar/original_app_bar.dart';
import 'package:darts_link_project/views/sort_page/components/feature_selector_view.dart';
import 'package:flutter/material.dart';

import 'components/area_selector_view.dart';
import 'components/recruitment_selector_view.dart';

class SortCircleSelectPage extends StatefulWidget {
  const SortCircleSelectPage({Key? key}) : super(key: key);

  @override
  State<SortCircleSelectPage> createState() => _SortCircleSelectPageState();
}

class _SortCircleSelectPageState extends State<SortCircleSelectPage> {
  Pref? selectedPref;
  City? selectedCity;
  List<FeatureTagType>? selectedFeatures;
  bool? isRecruitment;

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

  void selectFeature(FeatureTagType feature) {
    if (selectedFeatures == null) {
      setState(() {
        selectedFeatures = [feature];
      });
      return;
    }
    if (selectedFeatures!.contains(feature)) {
      setState(() {
        selectedFeatures!.remove(feature);
      });
      return;
    }
    setState(() {
      selectedFeatures!.add(feature);
    });
  }

  void switchRecruitment(bool? value) {
    setState(() {
      isRecruitment = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OriginalAppBer(title: 'サークルの絞り込み'),
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
              FeatureSelectorView(
                onSelectFeature: selectFeature,
                selectedFeatures: selectedFeatures,
              ),
              const SizedBox(height: 32),
              RecruitmentSelectorView(
                isRecruitment: isRecruitment,
                onChanged: switchRecruitment,
              ),
              const Spacer(),
              OriginalButton(
                text: '絞り込み検索する',
                onPressed: () {
                  if (selectedPref == null &&
                      selectedCity == null &&
                      selectedFeatures == null &&
                      isRecruitment == null) {
                    Navigator.pop(context);
                    return;
                  }

                  final sortState = SortState(
                    pref: selectedPref,
                    city: selectedCity,
                    features: selectedFeatures,
                    isRecruitment: isRecruitment ?? false,
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
