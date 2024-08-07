import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePlanDialog extends StatefulWidget {
  final Function(String, String, String, String, String) onCreatePlan;
  final List<String> strategies;

  CreatePlanDialog({required this.onCreatePlan, required this.strategies});

  @override
  _CreatePlanDialogState createState() => _CreatePlanDialogState();
}

class _CreatePlanDialogState extends State<CreatePlanDialog> {
  final TextEditingController _teamNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String parentPlanDropdownValue = 'My Plan';
  String assignToPlanDropdownValue = 'All';
  final TextEditingController strategyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Create New Plan",
                  style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
            Text('Parent plan'),
            DropdownButtonFormField<String>(
              value: parentPlanDropdownValue,
              decoration: InputDecoration(
                labelText: '',
                border: OutlineInputBorder(),
              ),
              hint: Text('Nothing selected'),
              onChanged: (String? newValue) {
                setState(() {
                  parentPlanDropdownValue = newValue!;
                });
              },
              items: <String>['My Plan', 'Marketing Plan', 'Standard Plan', 'One Page Plan', 'Marketing']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: GoogleFonts.poppins(fontWeight: FontWeight.normal)),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text('Plan name'),
            TextField(
              controller: _teamNameController,
              decoration: InputDecoration(
                labelText: '',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text('Description'),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: '',
                border: OutlineInputBorder(),
              ),
              maxLines: 3, // Allows multi-line input
            ),
            SizedBox(height: 16),
            Text('Type'),
            DropdownButtonFormField<String>(
              value: assignToPlanDropdownValue,
              decoration: InputDecoration(
                labelText: '',
                border: OutlineInputBorder(),
              ),
              hint: Text('Nothing selected'),
              onChanged: (String? newValue) {
                setState(() {
                  assignToPlanDropdownValue = newValue!;
                });
              },
              items: <String>['All', 'Project Portfolio', 'Operational', 'Functional', 'Programmatic']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: GoogleFonts.poppins(fontWeight: FontWeight.normal)),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Text('Strategy'),
            EditableDropdown(
              options: widget.strategies,
              controller: strategyController,
              onItemSelected: (String value) {
                setState(() {
                  strategyController.text = value;
                });
              },
              onSubmitted: (String value) {
                if (value.isNotEmpty && !widget.strategies.contains(value)) {
                  setState(() {
                    widget.strategies.add(value);
                  });
                }
              },
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFFE94CD9),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  widget.onCreatePlan(
                    parentPlanDropdownValue,
                    _teamNameController.text,
                    assignToPlanDropdownValue,
                    _descriptionController.text,
                    strategyController.text,
                  );
                  Navigator.of(context).pop();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Success'),
                        content: Text('Plan created successfully!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditableDropdown extends StatelessWidget {
  final List<String> options;
  final TextEditingController controller;
  final Function(String) onItemSelected;
  final Function(String) onSubmitted;

  EditableDropdown({
    required this.options,
    required this.controller,
    required this.onItemSelected,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '',
              ),
              onSubmitted: onSubmitted,
            ),
          ),
          PopupMenuButton<String>(
            icon: Icon(Icons.arrow_drop_down),
            onSelected: onItemSelected,
            itemBuilder: (BuildContext context) {
              return options.map<PopupMenuItem<String>>((String value) {
                return PopupMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList();
            },
          ),
        ],
      ),
    );
  }
}

void _showCreatePlanDialog(BuildContext context, Function(String, String, String, String, String) onCreatePlan, List<String> strategies) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: CreatePlanDialog(
          onCreatePlan: onCreatePlan,
          strategies: strategies,
        ),
      );
    },
  );
}
