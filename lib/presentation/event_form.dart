import 'package:event_buddy/models/event_model.dart';
import 'package:event_buddy/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';

class EventForm extends StatefulWidget {
  const EventForm({super.key, required this.event});

  final EventModel event;

  @override
  State<EventForm> createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.event.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.network(widget.event.bannerImage),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Please Enter Your Detail",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                obscureText: true,
                style: TextStyle(
                  color: ColorConstants.blackColor, // Set the text color here
                ),
                cursorColor: ColorConstants.blackColor,
                // controller: _newPasswordController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  fillColor: ColorConstants.blackColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color: ColorConstants.hintColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color: ColorConstants.blackColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color: ColorConstants.hintColor,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color: ColorConstants.blackColor,
                    ),
                  ),
                  hintText: 'Name',
                  hintStyle: TextStyle(
                      fontSize: 14.0,
                      height: 1,
                      color: ColorConstants.hintColor),
                  focusColor: ColorConstants.blackColor,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is Required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                obscureText: true,
                style: TextStyle(
                  color: ColorConstants.blackColor, // Set the text color here
                ),
                cursorColor: ColorConstants.blackColor,
                // controller: _newPasswordController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  fillColor: ColorConstants.blackColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color: ColorConstants.hintColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color: ColorConstants.blackColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color: ColorConstants.hintColor,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color: ColorConstants.blackColor,
                    ),
                  ),
                  hintText: 'Email',
                  hintStyle: TextStyle(
                      fontSize: 14.0,
                      height: 1,
                      color: ColorConstants.hintColor),
                  focusColor: ColorConstants.blackColor,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                obscureText: true,
                style: TextStyle(
                  color: ColorConstants.blackColor, // Set the text color here
                ),
                cursorColor: ColorConstants.blackColor,
                // controller: _newPasswordController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  fillColor: ColorConstants.blackColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color: ColorConstants.hintColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color: ColorConstants.blackColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color: ColorConstants.hintColor,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color: ColorConstants.blackColor,
                    ),
                  ),
                  hintText: 'Phone No',
                  hintStyle: TextStyle(
                      fontSize: 14.0,
                      height: 1,
                      color: ColorConstants.hintColor),
                  focusColor: ColorConstants.blackColor,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Apply"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
