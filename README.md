

Flutter Project Structure Mason Brick
This Mason brick generates a structured Flutter project scaffold using GetX for state management, routing and dependency injection.
The project structure is designed for rapid development and scalability, offering clear separation between different application layers.

📦 Features
Layered Architecture: The generated project separates data, network, UI (presentation), and core functionalities into distinct directories.
Environment Configuration: Easily manage different environment setups like dev and prod using environment.dart.
Modular Design: Quickly add new features without disrupting the existing codebase.
GetX Integration: Preconfigured GetX components for state management, routing, and dependency injection.
🚀 How to Use
Prerequisites
Install the Mason CLI:
dart pub global activate mason_cli
Ensure that Flutter is installed on your system.
Step-by-Step Guide
Add the brick to your Mason registry:



mason add -g flutter_project_structure
Generate a new project: Create a new Flutter project using the brick:



mason make flutter_project_structure
Input the project details: During the generation process, Mason will prompt you for the project name and other necessary details.

Navigate to your project:



cd <your-project-name>
Run the Flutter app:

flutter pub get
flutter run