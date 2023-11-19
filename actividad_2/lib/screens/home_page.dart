import 'package:flutter/material.dart';
import '../models/activity.dart';
import '../styles/app_style.dart';
import '../widgets/activity_card.dart';
import './new_activity.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Activity> activities = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fitness Time"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Actividades",
              style: AppStyles.bigTitle,
            ),
            if (activities.isEmpty)
              const Padding(
                padding: EdgeInsets.all(80.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.run_circle_outlined,
                      size: 120,
                      color: Colors.black45,
                    ),
                    Text(
                      "No hay actividades. Pulsa el botón + para añadir una nueva.",
                      style: AppStyles.subTitle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            for (var activity in activities)
              Dismissible(
                onDismissed: (direction) {
                  activities.remove(activity);
                },
                key: UniqueKey(),
                child: ActivityCard(activity: activity),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var activity = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewActivity()));
          activities.add(activity);
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
