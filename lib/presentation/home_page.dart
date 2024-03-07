import 'dart:convert';
import 'dart:developer';
import 'package:event_buddy/models/event_model.dart';
import 'package:event_buddy/models/user_response_model.dart';
import 'package:event_buddy/network/locator.dart';
import 'package:event_buddy/presentation/add_event_page.dart';
import 'package:event_buddy/presentation/event_form.dart';
import 'package:event_buddy/utils/resources/events_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isAdmin = false;

  @override
  void initState() {
    loadUser();
    super.initState();
  }

  loadUser() async {
    var userData = await kPref.getUser();
    log(userData!);
    var user = UserResponse.fromJson(json.decode(userData!));
    isAdmin = user.user!.type == "company";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: isAdmin
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: Text(
                      'Welcome to Event Buddy',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Create Event'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddEventPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          : Container(),
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Events'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(height: 8);
          },
          itemBuilder: (context, index) {
            return EventCard(event: kEvents[index]);
          },
          itemCount: kEvents.length,
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event});
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EventForm(
              event: event,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Card(
          color: Colors.grey,
          child: Column(
            children: [
              Text(
                event.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Image.network(event.bannerImage),
              Text(
                event.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                event.openingDate,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                event.closingDate,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
