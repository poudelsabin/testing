import 'package:flutter/material.dart';
import 'package:flutter_event_calendar/flutter_event_calendar.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Event Calendar"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              EventCalendar(
                calendarType: CalendarType.GREGORIAN,
                calendarLanguage: 'en',
                events: [
                  Event(
                    child: _eventChild(
                      "Event 1",
                      "Return a string of new date selected like (year-month-day)",
                    ),
                    dateTime: CalendarDateTime(
                      year: 2024,
                      month: 3,
                      day: 12,
                      calendarType: CalendarType.GREGORIAN,
                    ),
                  ),
                  Event(
                    child: _eventChild(
                      "Event 2",
                      "Return a string of new date selected like (year-month-day)",
                    ),
                    dateTime: CalendarDateTime(
                      year: 2024,
                      month: 3,
                      day: 12,
                      calendarType: CalendarType.GREGORIAN,
                    ),
                  ),
                  Event(
                    child: _eventChild(
                      "Event 3",
                      "Return a string of new date selected like (year-month-day)",
                    ),
                    dateTime: CalendarDateTime(
                      year: 2024,
                      month: 3,
                      day: 12,
                      calendarType: CalendarType.GREGORIAN,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _eventChild(String title, content) => Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              content,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
