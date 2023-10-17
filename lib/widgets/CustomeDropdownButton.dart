import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String? initialValue;
  final ValueChanged<String?>? onChanged;

  CustomDropdown({this.initialValue, this.onChanged});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12,),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.lightGreen, width: 1.5), // Light green border
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedValue,
          icon: Icon(Icons.arrow_drop_down, color: Colors.lightGreen),
          dropdownColor: Colors.white,
          style: TextStyle(color: Colors.lightGreen),
          onChanged: (String? newValue) {
            setState(() {
              _selectedValue = newValue;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(newValue);
            }
          },
          items: <String>[
            "Last 7 days",
            "This Month",
            "Last month",
            "This Year",
            "Custom"
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
