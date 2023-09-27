import 'package:assignment/constants/colors.dart';
import 'package:assignment/constants/format_date.dart';
import 'package:assignment/constants/utils.dart';
import 'package:assignment/widget/attendance_box.dart';
import 'package:assignment/widget/event_stack.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetWidget extends StatelessWidget {
  final ValueNotifier<List<Event>> event;
  final DateTime day;
  BottomSheetWidget({required this.day, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 1.4,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(35)),
      padding: EdgeInsets.all(16),
      child: ValueListenableBuilder<List<Event>>(
        valueListenable: event,
        builder: (context, value, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                indent: Get.width / 2.8,
                endIndent: Get.width / 2.8,
                thickness: 5,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        formatDate(day.toString()),
                        style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 24,
                            fontWeight: FontWeight.w800),
                      ),
                      Divider(
                        indent: 3,
                        endIndent: 3,
                        thickness: 1,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            return Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                  vertical: 4.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                // child: ListTile(
                                //   onTap: () => print('${value[index]}'),
                                //   title: Text('${value[index]}'),
                                // ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '8:00 PM-6:45 PM',
                                          style: TextStyle(
                                              color: AppColors.asset3),
                                        ),
                                        Text(
                                          'Attandance',
                                          style: TextStyle(
                                              color: AppColors.asset3),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'Juniour Squad',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 18),
                                        ),
                                        Row(
                                          children: [
                                            AttendanceBox(
                                                text: '12',
                                                color: AppColors.asset1),
                                            AttendanceBox(
                                                text: '3',
                                                color: AppColors.asset2),
                                            AttendanceBox(
                                                text: '9',
                                                color: AppColors.asset3),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: Get.width * 0.14,
                                          height: Get.height * 0.03,
                                          child: PersonStacker(
                                            images: [
                                              'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
                                              'https://media.istockphoto.com/id/1471378406/photo/the-scene-of-the-wellington-point-recreation-reserve-in-the-sunset-in-brisbane.jpg?s=2048x2048&w=is&k=20&c=BAr_FHzwa_AWpXXIaRukQgYZhVeGG0TrhVaolsiM7qk=',
                                              'https://media.istockphoto.com/id/1471378405/photo/the-scene-of-the-footpath-along-the-coast-in-the-wellington-point-recreation-reserve-in-the.jpg?s=2048x2048&w=is&k=20&c=r9Ohl8oMUVvyMx0LLFSoVKfbc9frk4zVjz6WSx6Cta8=',
                                              'https://media.istockphoto.com/id/1490611223/photo/sunset-over-pier-60-clearwater-florida.jpg?s=2048x2048&w=is&k=20&c=97lkDjEQrSnyH46rb8U1KNDEA4MUKO1Je3cV5davRAc='
                                            ],
                                          ),
                                        ),
                                        Text(
                                          '20',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        IconButton(
                                            onPressed: null,
                                            icon: Icon(
                                              Icons.chat_bubble_outline_rounded,
                                              color: AppColors.primary,
                                              size: 18,
                                            ))
                                      ],
                                    ),
                                    Divider(
                                      indent: 3,
                                      endIndent: 3,
                                      thickness: 1,
                                    ),
                                  ],
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
