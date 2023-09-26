import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import '../constants/colors.dart';

class BottomSheetCalendar extends StatefulWidget {
  @override
  _BottomSheetCalendarState createState() => _BottomSheetCalendarState();
}

class _BottomSheetCalendarState extends State<BottomSheetCalendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now().subtract(Duration(days: 18 * 365));
  DateTime? _selectedDay;
  DateTime kFirstDay = DateTime.now().subtract(Duration(days: 120 * 365));
  DateTime kLastDay = DateTime.now().subtract(Duration(days: 18 * 365));
  @override
  Widget build(BuildContext context) {
    double baseWidth = 385;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.white, width: 0.2),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(52), topLeft: Radius.circular(52))),
      height: fem * 680,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            // indicatorS8G (309:6035)
            left: 174 * fem,
            top: 10 * fem,
            child: Align(
              child: SizedBox(
                width: 27 * fem,
                height: 12.06 * fem,
                child: Image.asset(
                  'assets/ui-kit/images/indicator-hRS.png',
                  width: 27 * fem,
                  height: 12.06 * fem,
                ),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: TableCalendar(
                  daysOfWeekHeight: 40 * fem,
                  firstDay: kFirstDay,
                  lastDay: kLastDay,
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  headerStyle: HeaderStyle(
                      titleCentered: true,
                      formatButtonVisible: false,
                      headerMargin: EdgeInsets.fromLTRB(
                          0 * fem, 20 * fem, 0 * fem, 20 * fem),
                      leftChevronIcon: Icon(
                        Icons.chevron_left,
                        color: AppColors.primary,
                      ),
                      rightChevronIcon: Icon(
                        Icons.chevron_right,
                        color: AppColors.primary,
                      )),
                  calendarStyle: CalendarStyle(
                    // cellMargin: EdgeInsets.fromLTRB(
                    //     10 * fem, 10 * fem, 10 * fem, 10 * fem),
                    outsideDaysVisible: false,
                    selectedDecoration: BoxDecoration(
                        color: AppColors.primary, shape: BoxShape.circle),
                    // defaultTextStyle:
                    // AppTextStyle.buildSafeGoogleFont14412575black(
                    //     ffem, fem),
                  ),
                  selectedDayPredicate: (day) {
                    // Use `selectedDayPredicate` to determine which day is currently selected.
                    // If this returns true, then `day` will be marked as selected.

                    // Using `isSameDay` is recommended to disregard
                    // the time-part of compared DateTime objects.
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      // Call `setState()` when updating the selected day
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    }
                  },
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      // Call `setState()` when updating calendar format
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                  onPageChanged: (focusedDay) {
                    // No need to call `setState()` here
                    _focusedDay = focusedDay;
                  },
                ),
              ),
              // Container(
              //     margin: EdgeInsets.fromLTRB(
              //         20 * fem, 0 * fem, 20 * fem, 40 * fem),
              //     child: CommonButton(
              //         fem: fem,
              //         ffem: ffem,
              //         onPress: () {
              //           Get.back();
              //         },
              //         text: 'Save')
              // )
            ],
          ),
        ],
      ),
    );
  }
}
