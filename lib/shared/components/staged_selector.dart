import 'package:flutter/material.dart';
import '../../core/models/organization_unit.dart';

class StagedSelector extends StatefulWidget {
  final List<OrganizationUnit> data;

  const StagedSelector({required this.data, Key? key}) : super(key: key);

  @override
  _StagedSelectorState createState() => _StagedSelectorState();
}

class _StagedSelectorState extends State<StagedSelector> {
  OrganizationUnit? selectedLevel1;
  OrganizationUnit? selectedLevel2;
  OrganizationUnit? selectedLevel3;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<OrganizationUnit>(
          hint: Text('Select Level 1'),
          value: selectedLevel1,
          onChanged: (value) {
            setState(() {
              selectedLevel1 = value;
              selectedLevel2 = null;
              selectedLevel3 = null;
            });
          },
          items: widget.data.map((unit) {
            return DropdownMenuItem(value: unit, child: Text(unit.name));
          }).toList(),
        ),
        if (selectedLevel1 != null && selectedLevel1!.children != null)
          DropdownButton<OrganizationUnit>(
            hint: Text('Select Level 2'),
            value: selectedLevel2,
            onChanged: (value) {
              setState(() {
                selectedLevel2 = value;
                selectedLevel3 = null;
              });
            },
            items: selectedLevel1!.children!.map((unit) {
              return DropdownMenuItem(value: unit, child: Text(unit.name));
            }).toList(),
          ),
        if (selectedLevel2 != null && selectedLevel2!.children != null)
          DropdownButton<OrganizationUnit>(
            hint: Text('Select Level 3'),
            value: selectedLevel3,
            onChanged: (value) {
              setState(() {
                selectedLevel3 = value;
              });
            },
            items: selectedLevel2!.children!.map((unit) {
              return DropdownMenuItem(value: unit, child: Text(unit.name));
            }).toList(),
          ),
      ],
    );
  }
}
