import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thepilot_test/common/models/card.model.dart';
import 'package:thepilot_test/features/assigned_class/view/assigned_class.view.dart';
import 'package:thepilot_test/features/home/view/home.view.dart';

final homeControllerProvider = Provider<HomeController>((ref) {
  return HomeController();
});

class HomeController {
  List<CardModel> getCards() {
    return [
      CardModel(
        title: "Percentage",
        subtitle: "From Last Month",
        value: "87.52",
        percentage: "12%",
        valueText: "%",
        imageBackground: false,
        crossAxisCount: 1,
        mainAxisCount: 1,
        backgroundColor: Color(0xFF006FFD),
        isInfoCard: true,
      ),
      CardModel(
        title: "Percentage",
        subtitle: "From Last Month",
        value: "87.52",
        percentage: "12%",
        valueText: "classes",
        imageBackground: false,
        crossAxisCount: 1,
        mainAxisCount: 1,
        backgroundColor: Color(0xFF006FFD),
        isInfoCard: true,
      ),
      CardModel(
        title: "Homeroom",
        subtitle: "Your classroom awaits you",
        imageBackground: true,
        crossAxisCount: 2,
        mainAxisCount: 1,
        backgroundColor: Color(0xFF006FFD),
        isInfoCard: false,
        bottomLeftCornerWidget: Image.asset(
          'assets/images/workspace.webp',
          height: 80,
        ),
      ),
      CardModel(
        title: "Assigned Classes",
        subtitle: "Your classroom awaits you",
        imageBackground: true,
        crossAxisCount: 1,
        mainAxisCount: 2,
        backgroundColor: Colors.black,
        isInfoCard: false,
        redirectTo: "${HomeScreen.route}/${AssignedClassScreen.route}",
        folderIcon: true,
      ),
      CardModel(
        title: "Announcements",
        subtitle: "Your classroom awaits you",
        imageBackground: true,
        crossAxisCount: 1,
        mainAxisCount: 1,
        backgroundColor: Color(0xFF006FFD),
        isInfoCard: false,
        folderIcon: true,
      ),
      CardModel(
        title: "Notes & Storage",
        subtitle: "Your classroom awaits you",
        imageBackground: true,
        crossAxisCount: 1,
        mainAxisCount: 1,
        backgroundColor: Color(0xFF006FFD),
        isInfoCard: false,
        folderIcon: true,
      ),
    ];
  }
}
