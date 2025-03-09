import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thepilot_test/common/models/card.model.dart';

final assignedClassesControllerProvider = Provider<AssignedClassesController>((
  ref,
) {
  return AssignedClassesController();
});

class AssignedClassesController {
  List<CardModel> getCards() {
    return [
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
        title: "Announcements",
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
