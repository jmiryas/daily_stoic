import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../constants/constants.dart';

class TodayStoicScreen extends StatelessWidget {
  const TodayStoicScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: scaffoldBgColor,
      body: Container(
        width: width,
        height: height,
        // color: Colors.amber,
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            width: width,
            height: 0.7 * height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54.withOpacity(0.2),
                  blurRadius: 10.0,
                  offset: const Offset(3.0, 3.0),
                  spreadRadius: 0.1,
                  blurStyle: BlurStyle.normal,
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  width: width,
                  height: 0.1 * (0.7 * height),
                  decoration: const BoxDecoration(
                    color: scaffoldBgColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                  ),
                  child: const ListTile(
                    title: Text(
                      "CONTROL AND CHOICE",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Icon(
                      Icons.more_horiz,
                      color: Colors.black,
                    ),
                    dense: true,
                  ),
                ),
                SizedBox(
                  width: width,
                  height: 0.9 * (0.7 * height),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: width,
                        height: 0.2 * (0.9 * (0.7 * height)),
                        padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 5.0),
                        child: const Align(
                          alignment: Alignment.bottomCenter,
                          child: CircleAvatar(
                            backgroundColor: scaffoldBgColor,
                            radius: 30.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width,
                        height: 0.1 * (0.9 * (0.7 * height)),
                        // color: Colors.orange,
                        child: const Center(
                          child: Text(
                            "EPICTETUS",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: width,
                        height: 0.6 * (0.9 * (0.7 * height)),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        child: const Align(
                          alignment: Alignment.topCenter,
                          child: AutoSizeText(
                            "❝\t\tThe chief task in life is simply this: to identify and separate matters so that I can say clearly to myself which are externals not under my control, and which have to do with the choices I actually control. Where then do I look for good and evil? Not to uncontrollable externals, but within myself to the choices that are my own ...\t\t❞",
                            textAlign: TextAlign.center,
                            minFontSize: 15.0,
                            maxFontSize: 30.0,
                            style: TextStyle(
                              height: 1.5,
                              fontSize: 30.0,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w300,
                            ),
                            maxLines: 8,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            builder: ((context) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                margin: const EdgeInsets.all(15.0),
                                decoration: BoxDecoration(
                                  color: scaffoldBgColor,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              );
                            }),
                          );
                        },
                        child: Container(
                          width: width,
                          height: 0.1 * (0.9 * (0.7 * height)),
                          decoration: const BoxDecoration(
                            color: scaffoldBgColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0),
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_drop_up_rounded,
                              size: 0.9 * (0.1 * (0.9 * (0.7 * height))),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
