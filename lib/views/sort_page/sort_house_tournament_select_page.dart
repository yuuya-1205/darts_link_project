import 'package:darts_link_project/components/original_button.dart';
import 'package:darts_link_project/models/city.dart';
import 'package:darts_link_project/models/pref.dart';
import 'package:darts_link_project/models/sort_state.dart';
import 'package:darts_link_project/models/tag_type.dart';
import 'package:darts_link_project/views/components/original_app_bar/original_app_bar.dart';
import 'package:flutter/material.dart';

import 'components/area_selector_view.dart';
import 'components/darts_model_selector_view.dart';
import 'components/date_selector_view.dart';
import 'components/recruitment_selector_view.dart';

class SortHouseTournamentSelectPage extends StatefulWidget {
  const SortHouseTournamentSelectPage({Key? key}) : super(key: key);

  @override
  State<SortHouseTournamentSelectPage> createState() =>
      _SortHouseTournamentSelectPageState();
}

class _SortHouseTournamentSelectPageState
    extends State<SortHouseTournamentSelectPage> {
  Pref? selectedPref;
  City? selectedCity;
  DateTime? selectedDate;
  List<DartsModelTagType>? selectedDartsModels;
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

  void submitDateSelector(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  void selectDartsModel(DartsModelTagType dartsModel) {
    if (selectedDartsModels == null) {
      setState(() {
        selectedDartsModels = [dartsModel];
      });
      return;
    }
    if (selectedDartsModels!.contains(dartsModel)) {
      setState(() {
        selectedDartsModels!.remove(dartsModel);
      });
      return;
    }
    setState(() {
      selectedDartsModels!.add(dartsModel);
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
      appBar: const OriginalAppBer(title: 'ハウトーの絞り込み'),
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
              DateSelectorView(
                selectedDateTime: selectedDate,
                onSubmitDateSelector: submitDateSelector,
              ),
              const SizedBox(height: 32),
              DartsModelSelectorView(
                onSelectDartsModel: selectDartsModel,
                selectedDartsModels: selectedDartsModels,
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
                      selectedDate == null &&
                      selectedDartsModels == null &&
                      isRecruitment == null) {
                    Navigator.pop(context);
                    return;
                  }

                  final sortState = SortState(
                    pref: selectedPref,
                    city: selectedCity,
                    date: selectedDate,
                    dartsModels: selectedDartsModels,
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
