import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thepilot_test/features/home/controller/home.controller.dart';
import 'package:thepilot_test/common/models/card.model.dart';
import 'package:thepilot_test/common/widgets/custom_card.widget.dart';
import 'package:thepilot_test/common/widgets/info_custom_card.widget.dart';

class HomeScreen extends ConsumerWidget {
  static const route = "/home";
  const HomeScreen({super.key});
  static int totalColumns = 2;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeController = ref.read(homeControllerProvider);
    final List<CardModel> cards = homeController.getCards();

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
        leading: SvgPicture.asset(
          'assets/svgs/user.svg',
          height: 40,
          fit: BoxFit.scaleDown,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset('assets/svgs/contact.svg'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: StaggeredGrid.extent(
            maxCrossAxisExtent: 200,
            mainAxisSpacing: 16,
            crossAxisSpacing: 8,
            children:
                cards.map((card) {
                  return StaggeredGridTile.extent(
                    crossAxisCellCount: card.crossAxisCount,
                    mainAxisExtent:
                        card.isInfoCard ||
                                (card.mainAxisCount == 1 &&
                                    card.crossAxisCount == 2)
                            ? 100
                            : card.mainAxisCount == 1
                            ? 140
                            : 296,
                    child:
                        card.isInfoCard
                            ? InfoCustomCard(card: card)
                            : CustomCard(card: card),
                  );
                }).toList(),
          ),
        ),
      ),
    );
  }
}
