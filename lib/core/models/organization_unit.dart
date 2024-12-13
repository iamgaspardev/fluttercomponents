class OrganizationUnit {
  final String id;
  final String name;
  final List<OrganizationUnit>? children;

  OrganizationUnit({
    required this.id,
    required this.name,
    this.children,
  });
}
