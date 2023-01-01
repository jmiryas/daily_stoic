import 'package:flutter/material.dart';

import '../data/daily_stoic.dart';
import '../constants/constants.dart';
import '../models/daily_stoic_model.dart';
import '../widgets/stoic_card_widget.dart';

class TodayStoicScreen extends StatefulWidget {
  const TodayStoicScreen({Key? key}) : super(key: key);

  @override
  State<TodayStoicScreen> createState() => _TodayStoicScreenState();
}

class _TodayStoicScreenState extends State<TodayStoicScreen> {
  DailyStoicModel dailyStoic = DailyStoicModel();
  bool isLoading = true;
  bool isExists = false;

  @override
  void initState() {
    super.initState();

    int currentMonth = DateTime.now().month;
    int currentDay = DateTime.now().day;

    setState(() {
      var dailyStoicResult = dailyStoicList
          .where(
            (element) =>
                element.date!.month == currentMonth &&
                element.date!.day == currentDay,
          )
          .toList();

      dailyStoic = dailyStoicResult[0];

      isExists = dailyStoicResult.isNotEmpty ? true : false;

      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: scaffoldBgColor,
      body: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            Container(
              width: width,
              height: 0.3 * height,
              color: const Color(containerBackgroundColor),
            ),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : isExists
                    ? StoicCardWidget(
                        width: width,
                        height: height,
                        stoic: dailyStoic,
                      )
                    : const Center(
                        child: Text("Sorry, daily stoic not found!"),
                      ),
          ],
        ),
      ),
    );
  }
}
