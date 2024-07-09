import 'package:flutter/material.dart';
import 'package:your_tracker/app/data/model%20/events_model.dart';
import 'package:your_tracker/app/shared/string_extension.dart';

class EventTrackedPackageCard extends StatelessWidget {
  final EventModel event;

  const EventTrackedPackageCard({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 0.1,
          ),
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${event.date} ${event.hours}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Text(
              event.place,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              event.status,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 5),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: event.subStatus.length,
              itemBuilder: (BuildContext context, int index) {
                final subStatus = event.subStatus[index];

                return Text(
                  subStatus.toString().stripHtmlIfNeeded(),
                  style: Theme.of(context).textTheme.bodySmall,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
