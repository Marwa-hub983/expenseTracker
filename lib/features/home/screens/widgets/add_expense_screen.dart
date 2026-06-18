import 'package:expense_trackerapp/features/home/domain/expense_model.dart';
import 'package:expense_trackerapp/shared/constants/colors.dart';
import 'package:expense_trackerapp/shared/utils/responsive_utils.dart';
import 'package:expense_trackerapp/shared/widgets/appBar/appbar.dart';
import 'package:expense_trackerapp/shared/widgets/text_fields/text_fields_widget.dart';
import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final titleControlller = TextEditingController();
  final amountController = TextEditingController();
  final categoryController = TextEditingController();
  void saveExpense() {
    final box = Hive.box<ExpenseModel>('expenses');
    box.add(
      ExpenseModel(
        title: titleControlller.text,
        amount: double.tryParse(amountController.text) ?? 0.0,
        category: categoryController.text,
        date: DateTime.now(),
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: 'Add Expense',color: kBlack,iconColor: kWhite,),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextFeildWidget(
              controller: titleControlller,
              labelText: 'Expense Title',
            ),  SizedBox(height: ResponsiveUtils.scaleH(context, 12)),
                TextFeildWidget(controller: categoryController, labelText: 'Category'),
            SizedBox(height: ResponsiveUtils.scaleH(context, 12)),
            TextFeildWidget(controller: amountController, labelText: 'Amount'),
            SizedBox(height: ResponsiveUtils.scaleH(context, 20)),
            ElevatedButton(onPressed: saveExpense, child: const Text('Save'))
          ],
        ),
      ),
    );
  }
}
