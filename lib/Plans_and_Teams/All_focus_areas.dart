import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'Create_Plan_Dialog.dart';

class AllFocusAreasTab extends StatefulWidget {
  @override
  _AllFocusAreasTabState createState() => _AllFocusAreasTabState();
}

class _AllFocusAreasTabState extends State<AllFocusAreasTab> {
  bool _isIconClicked = false;
  bool displayClassList = false;
  TextEditingController controller = TextEditingController();
  TextEditingController strategyController = TextEditingController();

  String dropdownValue1 = 'All';
  String dropdownValue2 = 'A';

  List<Map<String, String>> plans = [];
  List<String> strategies = [];

  void _handleIconClick() {
    setState(() {
      _isIconClicked = true;
    });

    Timer(Duration(seconds: 1), () {
      setState(() {
        _isIconClicked = false;
      });
    });
  }

  void _handleItemSelection(String selectedItem) {
    setState(() {
      controller.text = selectedItem;
      displayClassList = false;
    });
  }

  void _showCreatePlanDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: CreatePlanDialog(
            onCreatePlan: (planName, teamName, assignToPlan, description, strategy) {
              setState(() {
                plans.add({
                  'planName': planName,
                  'teamName': teamName,
                  'assignToPlan': assignToPlan,
                  'description': description,
                  'strategy': strategy,
                });
                if (!strategies.contains(strategy)) {
                  strategies.add(strategy);
                }
              });
            },
            strategies: strategies,
          ),
        );
      },
    );
  }

  void _removePlan(int index) {
    setState(() {
      plans.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Search bar
              Center(
                child: Container(
                  width: 310, // Width for the search bar
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: "Search",
                      contentPadding: EdgeInsets.symmetric(vertical: 5),
                      prefixIcon: GestureDetector(
                        onTap: _handleIconClick,
                        child: Icon(
                          Icons.search,
                          color: _isIconClicked ? Colors.blue : Colors.grey,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(
                          color: Color(0xFFE7E8E8),
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(
                          color: Color(0xFFE7E8E8),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20), // Use height instead of width for vertical spacing
              Center(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Center the row
                    children: [
                      Container(
                        width: 150, // Set a fixed width for the dropdowns
                        height: 55,

                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFFE7E8E8),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: dropdownValue1,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.black),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue1 = newValue!;
                              });
                            },
                            items: <String>[
                              'All',
                              'Project Portfolio',
                              'Operational',
                              'Functional',
                              'Programmatic'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        width: 150,
                        height: 55,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFFE7E8E8),
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: dropdownValue2,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Colors.deepPurple),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue2 = newValue!;
                              });
                            },
                            items: <String>['A', 'B', 'C', 'D']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 125,
                      height: 50, // Width for the button
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFFE94CD9),
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Color(0xFFE94CD9), width: 2.0),
                          ),
                        ),
                        onPressed: _showCreatePlanDialog,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add, size: 18),
                            SizedBox(width: 4),
                            Text("New Plan", style: GoogleFonts.inter(fontSize: 14)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ...plans.asMap().entries.map((entry) {
                int index = entry.key;
                Map<String, String> plan = entry.value;
                return Container(
                  width: 400,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFE7E8E8),
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Plan: ",
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                                ),
                                TextSpan(
                                  text: "${plan['planName']}",
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red, size: 20),
                            onPressed: () => _removePlan(index),
                          ),
                        ],
                      ),
                      SizedBox(height: 0),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Team: ",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                            TextSpan(
                              text: "${plan['teamName']}",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Assigned to: ",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                            TextSpan(
                              text: "${plan['assignToPlan']}",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Description: ",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                            TextSpan(
                              text: "${plan['description']}",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Strategy: ",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                            TextSpan(
                              text: "${plan['strategy']}",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}
