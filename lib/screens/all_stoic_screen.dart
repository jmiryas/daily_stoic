import 'package:flutter/material.dart';

import '../data/daily_stoic.dart';
import '../constants/constants.dart';
import '../models/daily_stoic_model.dart';
import '../widgets/stoic_card_widget.dart';

class AllStoicScreen extends StatefulWidget {
  const AllStoicScreen({Key? key}) : super(key: key);

  @override
  State<AllStoicScreen> createState() => _AllStoicScreenState();
}

class _AllStoicScreenState extends State<AllStoicScreen> {
  List<DailyStoicModel> allDailyStoic = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    setState(() {
      allDailyStoic = dailyStoicList;

      isLoading = !isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double viewPadding = MediaQuery.of(context).viewPadding.top;

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
                : allDailyStoic.isNotEmpty
                    ? SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(top: viewPadding),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: allDailyStoic.map((stoic) {
                              return StoicCardWidget(
                                width: width,
                                height: height,
                                stoic: stoic,
                              );
                            }).toList(),
                          ),
                        ),
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
