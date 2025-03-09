import 'package:flutter/material.dart';
import 'package:thepilot_test/features/assigned_class/model/student.model.dart';

class StudentTileWidget extends StatelessWidget {
  const StudentTileWidget({
    required this.student,
    required this.isExpanded,
    required this.index,
    super.key,
  });
  final StudentModel student;
  final bool isExpanded;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFFF3F3F3),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black.withOpacity(0.3), width: 0.3),
      ),
      child: Row(
        children: [
          Container(
            height: 39,
            width: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFF006FFD),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              index.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Student Name",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                ),
              ),
              Text(
                student.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Spacer(),
          AnimatedRotation(
            turns: isExpanded ? 0.5 : 0,
            duration: Duration(milliseconds: 300),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF006FFD),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.keyboard_arrow_down, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class StudentExpandedTileWidget extends StatelessWidget {
  const StudentExpandedTileWidget({required this.student, super.key});
  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.only(top: 18, left: 10, right: 10, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        color: Color(0xFFF3F3F3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(4, (index) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 48,
                width: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFF006FFD),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  height: 38,
                  width: 38,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "${student.attendance}%",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              Text(
                'Attendance',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
              ),
            ],
          );
        }),
      ),
    );
  }
}
