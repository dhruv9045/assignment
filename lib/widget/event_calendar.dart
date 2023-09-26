// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:assignment/constants/colors.dart';
import 'package:assignment/widget/actionIconButton.dart';
import 'package:assignment/widget/appBar.dart';
import 'package:assignment/widget/calendar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'utils.dart';

class TableEventsExample extends StatefulWidget {
  @override
  _TableEventsExampleState createState() => _TableEventsExampleState();
}

class _TableEventsExampleState extends State<TableEventsExample> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
      _selectedEvents.value = _getEventsForDay(selectedDay);
      if (_selectedEvents.value.isNotEmpty) {
        Get.bottomSheet(
          Container(
            height: 300,
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(35)),
          ),
          isDismissible: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          enableDrag: false,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context, title: 'Schedule', actions: [
        ActionIcon(onPress: null, icon: Icons.calendar_today),
        ActionIcon(onPress: null, icon: Icons.notifications_outlined)
      ]),
      body: Column(
        children: [
          TableCalendar<Event>(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            weekNumbersVisible: false,
            headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                leftChevronIcon: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(color: AppColors.white),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 18,
                        color: AppColors.primary,
                      )),
                ),
                rightChevronIcon: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(color: AppColors.white),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: AppColors.primary,
                      )),
                ),
                titleTextStyle: TextStyle(color: AppColors.white)),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            calendarFormat: CalendarFormat.month,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.sunday,
            calendarStyle: CalendarStyle(
              selectedTextStyle: TextStyle(color: AppColors.primary),
              outsideDaysVisible: true,
            ),
            onDaySelected: _onDaySelected,
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            daysOfWeekStyle: DaysOfWeekStyle(
                dowTextFormatter: (date, locale) =>
                    DateFormat.E(locale).format(date)[0],
                weekendStyle: TextStyle(color: AppColors.white),
                weekdayStyle: TextStyle(color: AppColors.white)),
            onHeaderTapped: (val) {
              Get.bottomSheet(
                BottomSheetCalendar(),
                barrierColor: Colors.red[50],
                isDismissible: false,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                    side: BorderSide(width: 5, color: Colors.black)),
                enableDrag: false,
              );
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        onTap: () => print('${value[index]}'),
                        title: Text('${value[index]}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BottomSheetWidget extends StatelessWidget {
  final DateTime selectedDate;

  BottomSheetWidget({required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Customize your bottom sheet content here
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Selected Date: ${selectedDate.toLocal()}',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 16),
          Text(
            'Add your content here.',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
