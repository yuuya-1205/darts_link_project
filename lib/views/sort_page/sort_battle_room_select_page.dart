import 'package:darts_link_project/models/city.dart';
import 'package:darts_link_project/models/pref.dart';
import 'package:darts_link_project/models/sort_state.dart';
import 'package:darts_link_project/views/components/app_bar_back_view.dart';
import 'package:flutter/material.dart';

import '../components/original_button.dart';
import 'components/area_selector_view.dart';
import 'components/date_selector_view.dart';
import 'components/recruitment_selector_view.dart';

class SortBattleRoomSelectPage extends StatefulWidget {
  const SortBattleRoomSelectPage({Key? key}) : super(key: key);

  @override
  State<SortBattleRoomSelectPage> createState() =>
      _SortBattleRoomSelectPageState();
}

class _SortBattleRoomSelectPageState extends State<SortBattleRoomSelectPage> {
  Pref? selectedPref;
  City? selectedCity;
  DateTime? selectedDate;
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

  void switchRecruitment(bool? value) {
    setState(() {
      isRecruitment = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 76,
        title: const Text('対戦車募集の絞り込み'),
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
              DateSelectorView(
                selectedDateTime: selectedDate,
                onSubmitDateSelector: submitDateSelector,
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
                      isRecruitment == null) {
                    Navigator.pop(context);
                    return;
                  }

                  final sortState = SortState(
                    pref: selectedPref,
                    city: selectedCity,
                    date: selectedDate,
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
