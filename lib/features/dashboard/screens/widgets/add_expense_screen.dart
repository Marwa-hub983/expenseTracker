import 'package:expense_trackerapp/features/dashboard/domain/expense_model.dart';
import 'package:expense_trackerapp/shared/widgets/appBar/appbar.dart';

import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:intl/intl.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final amountController = TextEditingController();
  final noteController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  String selectedCategory = 'Shopping';

  final List<Map<String, dynamic>> categories = [
    {'name': 'Shopping', 'icon': Icons.shopping_bag_outlined},
    {'name': 'Dining', 'icon': Icons.restaurant_outlined},
    {'name': 'Transport', 'icon': Icons.directions_car_outlined},
    {'name': 'Others', 'icon': Icons.grid_view},
  ];

  Future<void> saveExpense() async {
    final amount = double.tryParse(amountController.text);

    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid amount')),
      );
      return;
    }

    final box = Hive.box<ExpenseModel>('expenses');

    await box.add(
      ExpenseModel(
        title: noteController.text.isEmpty
            ? selectedCategory
            : noteController.text,
        amount: amount,
        category: selectedCategory,
        date: selectedDate,
        note: noteController.text,
      ),
    );

    if (mounted) {
      Navigator.pop(context);
    }
  }

  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2035),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void dispose() {
    amountController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020C24),

      appBar: AppbarWidget(
title: 'EXPENSE TRACKER',

      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      const Text(
                        'AMOUNT',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 11,
                          letterSpacing: 2,
                        ),
                      ),

                      const SizedBox(height: 16),

                      TextField(
                        controller: amountController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '0.00',
                          hintStyle: TextStyle(color: Colors.white24),
                          prefixText: '₹ ',
                          prefixStyle: TextStyle(
                            color: Colors.amber,
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Category',
                          style: TextStyle(color: Colors.white.withOpacity(.8)),
                        ),
                      ),

                      const SizedBox(height: 12),

                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: categories.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: .9,
                            ),
                        itemBuilder: (context, index) {
                          final category = categories[index];

                          final selected = selectedCategory == category['name'];

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategory = category['name'];
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: selected
                                    ? Colors.amber.withOpacity(.15)
                                    : const Color(0xFF13203E),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: selected
                                      ? Colors.amber
                                      : Colors.transparent,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    category['icon'],
                                    color: selected
                                        ? Colors.amber
                                        : Colors.white,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    category['name'],
                                    style: TextStyle(
                                      color: selected
                                          ? Colors.amber
                                          : Colors.white,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 20),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Date',
                          style: TextStyle(color: Colors.white.withOpacity(.8)),
                        ),
                      ),

                      const SizedBox(height: 10),

                      GestureDetector(
                        onTap: pickDate,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 18,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF13203E),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.calendar_month,
                                color: Colors.white70,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                DateFormat('dd/MM/yyyy').format(selectedDate),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Note',
                          style: TextStyle(color: Colors.white.withOpacity(.8)),
                        ),
                      ),

                      const SizedBox(height: 10),

                      TextField(
                        controller: noteController,
                        maxLines: 4,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'What was this for?',
                          hintStyle: const TextStyle(color: Colors.white38),
                          filled: true,
                          fillColor: const Color(0xFF13203E),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: saveExpense,
                  icon: const Icon(Icons.check_circle_outline),
                  label: const Text(
                    'Save Transaction',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
