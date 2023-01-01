import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../utils/utils.dart';
import '../constants/constants.dart';
import '../models/daily_stoic_model.dart';

class StoicCardWidget extends StatelessWidget {
  final double width;
  final double height;
  final DailyStoicModel stoic;

  const StoicCardWidget({
    super.key,
    required this.width,
    required this.height,
    required this.stoic,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  color: Color.fromARGB(255, 35, 157, 209),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                ),
                child: ListTile(
                  title: Text(
                    stoic.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
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
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: CircleAvatar(
                          backgroundColor: scaffoldBgColor,
                          radius: 30.0,
                          backgroundImage: AssetImage(
                            "assets/images/${stoic.name}.jpg",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width,
                      height: 0.1 * (0.9 * (0.7 * height)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            stoic.name.toUpperCase(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                          Text(
                            getFormattedDate(stoic.date!),
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1.3,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: width,
                      height: 0.6 * (0.9 * (0.7 * height)),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: AutoSizeText(
                          "❝\t\t${stoic.quote}\t\t❞",
                          textAlign: TextAlign.center,
                          minFontSize: 15.0,
                          maxFontSize: 30.0,
                          style: const TextStyle(
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
                              height: MediaQuery.of(context).size.height * 0.8,
                              margin: const EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                color: scaffoldBgColor,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: AutoSizeText(
                                          stoic.title,
                                          textAlign: TextAlign.center,
                                          minFontSize: 15.0,
                                          maxFontSize: 20.0,
                                          style: const TextStyle(
                                            fontFamily: "BodoniModa",
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            // letterSpacing: 1.3,
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 25.0,
                                      ),
                                      Container(
                                        width: width,
                                        height: 0.3 *
                                            (MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.8),
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                              "assets/images/${stoic.name}.jpg",
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 25.0,
                                      ),
                                      Text(
                                        stoic.name.toUpperCase(),
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                          letterSpacing: 1.5,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const Text(
                                        "January, 1st",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          letterSpacing: 1.3,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 25.0,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                          20.0,
                                          0.0,
                                          20.0,
                                          0.0,
                                        ),
                                        child: Text(
                                          "❝\t\t${stoic.quote}\t\t❞",
                                          textAlign: TextAlign.justify,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            height: 1.8,
                                            letterSpacing: 1.5,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 25.0,
                                      ),
                                      Text(
                                        stoic.description,
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          height: 1.8,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 25.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      },
                      child: Container(
                        width: width,
                        height: 0.1 * (0.9 * (0.7 * height)),
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 35, 157, 209),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_drop_up_rounded,
                            color: Colors.white,
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
    );
  }
}
