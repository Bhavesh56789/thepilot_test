import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thepilot_test/common/widgets/expansion_tile.widget.dart';
import 'package:thepilot_test/features/assigned_class/controller/assigned_class.controller.dart';
import 'package:thepilot_test/common/models/card.model.dart';
import 'package:thepilot_test/common/widgets/custom_card.widget.dart';
import 'package:thepilot_test/features/assigned_class/controller/student.controller.dart';
import 'package:thepilot_test/features/assigned_class/widgets/student_card.widget.dart';

class AssignedClassScreen extends ConsumerWidget {
  static const route = "assigned-classes";
  const AssignedClassScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final assignedClassesController = ref.read(
      assignedClassesControllerProvider,
    );
    final List<CardModel> cards = assignedClassesController.getCards();

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Column(
          children: [
            const Text(
              "Bhavesh Bellaney",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
            ),
            const Text(
              "Teacher (Homeroom)",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(0, 0, 0, 0.4),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset('assets/svgs/contact.svg'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 140,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: cards.length,
                itemBuilder: (context, index) => CustomCard(card: cards[index]),
                separatorBuilder: (context, index) => SizedBox(width: 8),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Students Stats',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SvgPicture.asset('assets/svgs/stats.svg'),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount:
                    ref.read(studentControllerProvider).getCards().length,
                separatorBuilder: (context, index) => SizedBox(height: 9),
                itemBuilder: (context, index) {
                  return ExpandableTile(
                    index: index,
                    tile:
                        (isExpanded) => StudentTileWidget(
                          student:
                              ref
                                  .read(studentControllerProvider)
                                  .getCards()[index],
                          isExpanded: isExpanded,
                          index: index + 1,
                        ),
                    expandedWidget: StudentExpandedTileWidget(
                      student:
                          ref.read(studentControllerProvider).getCards()[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
