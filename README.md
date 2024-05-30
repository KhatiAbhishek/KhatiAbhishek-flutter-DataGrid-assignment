# Flutter DataGrid with Pagination

This is a Flutter application for Windows that demonstrates the usage of a data grid with pagination. The data grid displays employee data with multiple columns, and supports paging through the data 10 rows at a time.

## Features

- Displays a data grid with employee information.
- Supports pagination to navigate through data.
- Shows 10 rows per page.

## Screenshots

![Screenshot 1](path/to/your/Image1.png)
![Screenshot 2](path/to/your/Image2.png)

## Getting Started

### Prerequisites

To run this application, you need to have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- [Visual Studio](https://visualstudio.microsoft.com/) with the "Desktop development with C++" workload (for building Windows apps)

### Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/KhatiAbhishek/KhatiAbhishek-flutter-DataGrid-assignment.git
    cd KhatiAbhishek-flutter-DataGrid-assignment
    ```

2. **Install dependencies:**

    ```bash
    flutter pub get
    ```

3. **Run the application:**

    ```bash
    flutter run -d windows
    ```

## Code Overview

### `main.dart`

- Entry point of the application.
- Initializes and runs the `MyApp` widget.

### `MyApp` widget

- A stateless widget that sets up the `MaterialApp` and defines `DataGridPage` as the home page.

### `DataGridPage` widget

- A stateful widget that sets up the data grid and pagination.
- Initializes `EmployeeDataSource` with a list of employees.
- Contains the `SfDataGrid` and `SfDataPager` widgets.

### `Employee` model

- Represents an employee with properties like `id`, `name`, `role`, etc.

### `EmployeeDataSource` class

- Extends `DataGridSource` and manages the data for the data grid.
- Implements methods to handle pagination and build rows.

## Pagination Logic

- `EmployeeDataSource` initializes `paginatedRows` with the first 10 rows.
- `handlePageChange` updates `paginatedRows` based on the current page index and refreshes the data grid.

## Dependencies

- `syncfusion_flutter_datagrid`: A package for creating data grids in Flutter.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

- [Syncfusion Flutter DataGrid](https://pub.dev/packages/syncfusion_flutter_datagrid) for providing the data grid widget.
- Flutter and Dart teams for the framework and language.

## Contact

If you have any questions or suggestions, feel free to reach out at [abhishek@example.com].
