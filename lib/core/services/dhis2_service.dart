import '../models/organization_unit.dart';

class DHIS2Service {
  Future<List<OrganizationUnit>> fetchOrganizationUnits() async {
    return [
      OrganizationUnit(id: 'TZ', name: 'Zanzibar', children: [
        OrganizationUnit(id: 'TZ-01', name: 'Sheiya', children: [
          OrganizationUnit(id: 'TZ-01-01', name: 'Facility A'),
          OrganizationUnit(id: 'TZ-01-02', name: 'Facility B'),
        ]),
        OrganizationUnit(id: 'TZ-02', name: 'Kaskazini', children: [
          OrganizationUnit(id: 'TZ-02-01', name: 'Facility C'),
          OrganizationUnit(id: 'TZ-02-02', name: 'Facility D'),
        ]),
      ]),
    ];
  }
}
