import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DataGrid with Pagination',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DataGridPage(),
    );
  }
}

class DataGridPage extends StatefulWidget {
  const DataGridPage({super.key});

  @override
  _DataGridPageState createState() => _DataGridPageState();
}

class _DataGridPageState extends State<DataGridPage> {
  late EmployeeDataSource _employeeDataSource;
  final int rowsPerPage = 10;

  @override
  void initState() {
    super.initState();
    _employeeDataSource = EmployeeDataSource(getEmployees());
  }

  List<Employee> getEmployees() {
    return List.generate(100, (index) => Employee(index + 1, 'Name $index', 'Role $index', 'Dept $index', 'Location $index', 'Email $index', 'Phone $index'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter DataGrid with Pagination'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SfDataGrid(
              source: _employeeDataSource,
              columns: <GridColumn>[
                GridColumn(columnName: 'ID', label: const Center(child: Text('ID'))),
                GridColumn(columnName: 'Name', label: const Center(child: Text('Name'))),
                GridColumn(columnName: 'Role', label: const Center(child: Text('Role'))),
                GridColumn(columnName: 'Dept', label: const Center(child: Text('Dept'))),
                GridColumn(columnName: 'Location', label: const Center(child: Text('Location'))),
                GridColumn(columnName: 'Email', label: const Center(child: Text('Email'))),
                GridColumn(columnName: 'Phone', label: const Center(child: Text('Phone'))),
              ],
            ),
          ),
          SfDataPager(
            delegate: _employeeDataSource,
            pageCount: (_employeeDataSource.employees.length / rowsPerPage).ceil().toDouble(),
            direction: Axis.horizontal,
          ),
        ],
      ),
    );
  }
}

class Employee {
  final int id;
  final String name;
  final String role;
  final String department;
  final String location;
  final String email;
  final String phone;

  Employee(this.id, this.name, this.role, this.department, this.location, this.email, this.phone);
}

class EmployeeDataSource extends DataGridSource {
  final List<Employee> employees;
  List<DataGridRow> dataGridRows = [];
  List<DataGridRow> paginatedRows = [];

  EmployeeDataSource(this.employees) {
    buildDataGridRows();
  }

  void buildDataGridRows() {
    dataGridRows = employees.map<DataGridRow>((employee) {
      return DataGridRow(cells: [
        DataGridCell<int>(columnName: 'ID', value: employee.id),
        DataGridCell<String>(columnName: 'Name', value: employee.name),
        DataGridCell<String>(columnName: 'Role', value: employee.role),
        DataGridCell<String>(columnName: 'Dept', value: employee.department),
        DataGridCell<String>(columnName: 'Location', value: employee.location),
        DataGridCell<String>(columnName: 'Email', value: employee.email),
        DataGridCell<String>(columnName: 'Phone', value: employee.phone),
      ]);
    }).toList();
    paginatedRows = dataGridRows.take(10).toList();
  }

  @override
  List<DataGridRow> get rows => paginatedRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: [
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(row.getCells()[0].value.toString()),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(row.getCells()[1].value),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(row.getCells()[2].value),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(row.getCells()[3].value),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(row.getCells()[4].value),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(row.getCells()[5].value),
      ),
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(row.getCells()[6].value),
      ),
    ]);
  }

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    final int startRowIndex = newPageIndex * 10;
    final int endRowIndex = startRowIndex + 10;
    if (startRowIndex < dataGridRows.length) {
      if (endRowIndex > dataGridRows.length) {
        paginatedRows = dataGridRows.sublist(startRowIndex, dataGridRows.length);
      } else {
        paginatedRows = dataGridRows.sublist(startRowIndex, endRowIndex);
      }
    }
    notifyListeners();
    return true;
  }
}
