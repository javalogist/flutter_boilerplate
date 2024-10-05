Project Structure Overview
This repository follows a clean and modular project structure using the GetX architecture. It is designed for rapid development and scalability,
ensuring separation of concerns and maintainability of the application. The folder structure and file placement are organized in a way
that makes it easy to add new features and maintain existing functionality.



lib/                                      # The root of the Flutter application-related files.  
│
├── app/                                  # Core application directory.
│   ├── config/                           # App configuration settings.
│   │   ├── app_constants.dart            # Global constants and configurations.
│   │   └── environment.dart              # Environment-specific configurations (dev, prod, etc.).
│   │
│   ├── core/                             # Core functionality and global components.
│   │   ├── bindings/                     # Global dependency bindings.
│   │   ├── models/                       # Global models used across the app.
│   │   ├── themes/                       # Application theme management.
│   │   └── utils/                        # Utility functions and extensions.
│   │
│   ├── data/                             # Data layer to manage API calls, local storage, and business logic.
│   │   ├── network/                      # Network module for API clients and interceptors.
│   │   ├── repositories/                 # Repositories to manage data fetching and persistence.
│   │   └── services/                     # Services to encapsulate business logic and interact with repositories.
│   │
│   ├── presentation/                     # Presentation layer, containing all UI and feature-related code.
│   │   ├── auth/                         # Authentication feature.
│   │   │   ├── bindings/                 # Auth-specific bindings.
│   │   │   ├── controllers/              # Auth-specific controllers.
│   │   │   └── views/                    # Auth views (e.g., Login screen).
│   │   │
│   │   ├── home/                         # Home feature.
│   │   ├── settings/                     # Settings feature.
│   │   └── shared/                       # Shared components used across features.
│   │       └── widgets/                  # Shared widgets like buttons, text fields, etc.
│   │
│   ├── routes/                           # Route management and navigation.
│   │   └── app_pages.dart                # Defines all routes and pages.
│   │
│   └── main.dart                         # Application entry point.
│
├── assets/                               # Static assets like images, fonts, etc.
├── fonts/                                # Font files used in the application.
└── images/                               # Image files used in the application.



Directory Descriptions
app/
Contains the main application code and is divided into several sub-modules to organize different aspects of the app.

config/: Stores configuration files such as global constants and environment settings.

core/: Houses the core components and global utilities, such as:

bindings/: Global bindings that register dependencies.
models/: Global models that are not specific to any feature.
themes/: Theme management for light and dark mode.
utils/: Utility functions and extensions used across the app.
data/: Responsible for managing the data flow of the application:

network/: Contains API clients, network interceptors, and related configurations.
repositories/: Manages data operations and serves as a bridge between the data layer and services.
services/: Business logic services that connect repositories to the presentation layer.
presentation/: Contains the UI and presentation logic for each feature:

Each feature (e.g., auth, home, settings) has its own directory with bindings, controllers, and views sub-folders.
Shared components used across features can be found under shared/.
routes/: Manages navigation and routing using GetX. All app routes are defined in app_pages.dart.

main.dart: The entry point of the application, which initializes dependencies and starts the app.

assets/
Stores static assets like images and fonts. This directory is further divided to organize fonts and images separately.

How to Use This Structure
Adding a New Feature:

Create a new folder inside the presentation/ directory with the feature name.
Add the bindings, controllers, and views sub-folders.
Define your bindings in the bindings folder, controllers in the controllers folder, and UI components in the views folder.
Working with the Data Layer:

Use the network/ folder to define API clients or HTTP interceptors.
Define repositories under the repositories/ folder, which interact with APIs or local data sources.
Business logic should be managed in the services/ folder to maintain a clear separation of concerns.
Navigation and Routing:

Define your routes in the app/routes/app_pages.dart file.
Use Get.to() and GetX navigation methods to navigate between different views.
Benefits of This Structure
Separation of Concerns: Clear separation of business logic, data handling, and presentation.
Scalability: Makes it easy to add new features without cluttering existing code.
Maintainability: Organized file structure ensures easy maintenance and debugging.
Technologies and Libraries Used
Flutter: The core framework.
GetX: State management, dependency injection, and routing.