# Bloc Examples

This project demonstrates various state management techniques using the Bloc library in Flutter.

## Features
- Implementation of multiple state management techniques using Bloc.
- Modular structure with core and feature-specific directories.
- Support for multiple platforms including Android, iOS, web, macOS, Linux, and Windows.
- Integration tests and unit tests for robust testing.

## Project Structure
- `lib/`: Contains the main application code, divided into `core` and `feature` directories.
- `test/`: Includes unit and widget tests for the application.
- `integration_test/`: Contains integration tests.
- `android/`, `ios/`, `web/`, `macos/`, `linux/`, `windows/`: Platform-specific configurations and code.
- `coverage/`: Stores code coverage reports.

## How to Run the Project
1. Ensure Flutter is installed on your system.
2. Navigate to the project directory in the terminal.
3. Run the following command to get dependencies:
   ```bash
   flutter pub get
   ```
4. Start the application using:
   ```bash
   flutter run
   ```
   You can specify the platform using the `-d` flag, e.g., `flutter run -d chrome` for web.

## Running Tests with Coverage

To run tests with code coverage and generate a report, follow these steps:

### 1. Run Tests with Coverage
Run the following command in the terminal:
```bash
flutter test --coverage
```
This will execute all tests and generate a coverage report in the `coverage/lcov.info` file.

### 2. Generate HTML Report
To view the coverage report in a browser, install `lcov` using Homebrew:
```bash
brew install lcov
```
Then, generate the HTML report:
```bash
genhtml -o coverage/html coverage/lcov.info
```

### 3. Open the Report
Open the generated HTML report in your default browser:
```bash
open coverage/html/index.html
```

### 4. View Coverage in VS Code
Alternatively, you can use the "Coverage Gutters" extension in VS Code to view coverage directly in the editor.

## Additional Notes
- Ensure all tests are located in the `test` directory.
- Integration tests can be run using:
```bash
flutter test integration_test
```
- Add coverage tracking to your CI/CD pipeline for automated monitoring.