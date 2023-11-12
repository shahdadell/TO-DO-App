import 'package:flutter/material.dart';

import '../widgets/bnottom_sheet_widget.dart';

class BottomSheetWidget extends StatelessWidget {
  BottomSheetWidget({super.key});

  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    var theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: formKey ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Add New Task",
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge!.copyWith(
                color: Colors.black,
              ),
            ),
            CustomTextFiled(
              controller: titleController ,
              title: "Enter Yor Task Title",
              validator:(String? value){
                if(value == null || value.trim().isEmpty){
                  return "You Must Enter Your Task Title" ;
                }
                else if(value.length<8){
                  return "Your Task Title Must be At Least 8 Characters" ;
                }
                return null ;
              },
            ),
            CustomTextFiled(
              controller: descriptionController ,
              title: "Enter Yor Task Description",
              validator:(String? value){
                if(value == null || value.trim().isEmpty){
                  return "You Must Enter Your Task Description" ;
                }
                else if(value.length<8){
                  return "Your Task Description Must be At Least 8 Characters";
                }
                return null ;
              },
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Add New Task",

                  style: theme.textTheme.bodyLarge!.copyWith(
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showCalender(context);
                  },
                  child: Text("5 Oct 2023",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: theme.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if(formKey.currentState!.validate()){
                  print(titleController.text);
                }
              },
              child: Text("Add Task",
                style: theme.textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCalender(context) {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365),),
    );

  }
}

