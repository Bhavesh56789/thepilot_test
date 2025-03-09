import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final expansionStateProvider = StateProvider.family<bool, int>(
  (ref, index) => false,
);

class ExpandableTile extends ConsumerWidget {
  final Widget Function(bool) tile;
  final Widget expandedWidget;
  final int index;

  const ExpandableTile({
    required this.tile,
    required this.expandedWidget,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = ref.watch(expansionStateProvider(index));

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            ref.read(expansionStateProvider(index).notifier).state =
                !isExpanded;
          },
          child: tile(isExpanded),
        ),
        AnimatedSize(
          duration: Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          child: isExpanded ? expandedWidget : SizedBox.shrink(),
        ),
      ],
    );
  }
}
