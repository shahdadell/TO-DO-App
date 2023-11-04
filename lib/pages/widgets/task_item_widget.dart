import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({super.key});

  @override
  Widget build(BuildContext context) {

    var theme = Theme.of(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20 , vertical:10),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Slidable(
        startActionPane:
        ActionPane(
          extentRatio: 0.28,
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(15.0),
              flex: 2,
              onPressed: (context) {},
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          height: 115,
          width: 400,
          padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 80,
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Play Basket Ball",
                    style: theme.textTheme.bodyLarge,
                  ),
                  Text("go to club with friends to play",
                    style: theme.textTheme.bodyMedium,
                  ),
                  Row(
                    children: [
                      Icon(Icons.alarm, size: 18,),
                      Text("10:30 AM",
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: 70,
                height: 35,
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset("assets/images/icon_check.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
