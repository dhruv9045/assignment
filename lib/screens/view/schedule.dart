import 'package:assignment/constants/colors.dart';
import 'package:assignment/widget/actionIconButton.dart';
import 'package:assignment/widget/appBar.dart';
import 'package:assignment/widget/calendar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../constants/utils.dart';

class EventSchedule extends StatefulWidget {
  @override
  _EventScheduleState createState() => _EventScheduleState();
}

class _EventScheduleState extends State<EventSchedule> {
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
        Scaffold.of(context).showBottomSheet(
          enableDrag: true,
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          )),
          (context) => BottomSheetWidget(
            event: _selectedEvents,
            day: selectedDay,
          ),
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
                outsideTextStyle:
                    TextStyle(color: AppColors.white.withOpacity(0.2)),
                weekendTextStyle: TextStyle(color: AppColors.white),
                weekNumberTextStyle: TextStyle(color: AppColors.white),
                selectedTextStyle: TextStyle(color: AppColors.primary),
                todayDecoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white.withOpacity(0.1)),
                defaultTextStyle: TextStyle(color: AppColors.white),
                todayTextStyle: TextStyle(
                  color: AppColors.white,
                ),
                selectedDecoration: BoxDecoration(
                    color: AppColors.white, shape: BoxShape.circle),
                outsideDaysVisible: true,
                markerDecoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.secondary)),
            onDaySelected: _onDaySelected,
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            daysOfWeekStyle: DaysOfWeekStyle(
                dowTextFormatter: (date, locale) =>
                    DateFormat.E(locale).format(date)[0],
                weekendStyle: TextStyle(color: AppColors.white),
                weekdayStyle: TextStyle(color: AppColors.white)),
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }
}
