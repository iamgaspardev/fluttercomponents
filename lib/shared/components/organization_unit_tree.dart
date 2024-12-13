// OrganizationUnitTree.dart

import 'package:flutter/material.dart';
import 'package:malaria_survillance_app/shared/components/checkbox.dart';
import '../../core/models/organization_unit.dart';
import '../../core/services/dhis2_service.dart';

class OrganizationUnitTree extends StatefulWidget {
  const OrganizationUnitTree({Key? key}) : super(key: key);

  @override
  _OrganizationUnitTreeState createState() => _OrganizationUnitTreeState();
}

class _OrganizationUnitTreeState extends State<OrganizationUnitTree> {
  final DHIS2Service dhis2Service = DHIS2Service();
  List<OrganizationUnit> orgUnits = [];
  final Map<String, bool> selectedUnits = {};

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final units = await dhis2Service.fetchOrganizationUnits();
    setState(() {
      orgUnits = units;
    });
  }

  void toggleSelection(String id, bool? isSelected) {
    setState(() {
      selectedUnits[id] = isSelected ?? false;
    });
  }

  Widget buildTree(OrganizationUnit unit) {
    final bool isSelected = selectedUnits[unit.id] ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckboxComponent(
          value: isSelected,
          label: unit.name,
          onChanged: (value) {
            toggleSelection(unit.id, value);
          },
        ),
        if (isSelected && unit.children != null)
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              children: unit.children!.map(buildTree).toList(),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return orgUnits.isEmpty
        ? CircularProgressIndicator()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: orgUnits.map(buildTree).toList(),
          );
  }
}
