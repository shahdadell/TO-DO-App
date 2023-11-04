import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htodo/pages/widgets/task_item_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return  Column(
      children: [
        Stack(
          alignment: Alignment(0,2.2),
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 160,
              width: double.infinity,
              color: theme.primaryColor,
              child: Text("To Do List",
                style: theme.textTheme.titleLarge,
              ),
            ),
            CalendarTimeline(
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(Duration(days: 365)),
              lastDate: DateTime.now().add(Duration(days: 365)),
              onDateSelected: (date) => print(date.weekday),
              leftMargin: 20,
              monthColor: Colors.black,
              dayColor: Colors.black,
              activeDayColor: Colors.black,
              activeBackgroundDayColor:Colors.white,
              dotsColor: Colors.white,
            ),

          ],
        ),
        const SizedBox(height:40,),
        Expanded(
            child: ListView.builder(
              padding:EdgeInsets.zero,
              itemBuilder:(context, index) => TaskItemWidget(),
              itemCount: 20,

            )
        ),
      ],
    );
  }
}
