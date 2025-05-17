# Movie List

This is a Flutter project that fetches movies from [The Movie Database (TMDb) API](https://www.themoviedb.org/) and displays them in a user-friendly interface. The project is built following **Clean Architecture** principles and adheres to **SOLID** design principles, utilizing the **Repository Pattern** and other best practices.

## Project Structure

The project is organized into the following layers inside the `lib` folder:

1. **Presentation Layer**: Contains UI components (widgets) and state management logic.
   - Example: `movie_page.dart` contains the UI for displaying the list of movies.
   - State management is handled using [Bloc State Management Library]

2. **Domain Layer**: Contains business logic, use cases, and entity definitions.
   - Repositoy: `movie_repository.dart` defines the contract for fetching movies.
   - Entities like `Movie` are defined here to represent core business models.

3. **Data Layer**: Handles data fetching and persistence, including API calls and repository implementations.
   - Example: `movie_repository_impl.dart` implements the `MovieRepository` interface and fetches data from TMDb API using `movie_client.dart`.

## Design Principles and Patterns

### 1. **SOLID Principles**
- **Single Responsibility Principle (SRP)**: Each class has a single responsibility.
  - Example: `movie_client.dart` is solely responsible for making API calls.
- **Open/Closed Principle (OCP)**: Classes are open for extension but closed for modification.
  - Example: The `MovieRepository` interface allows adding new data sources without modifying existing code.
- **Liskov Substitution Principle (LSP)**: Subtypes can replace their base types.
  - Example: `MovieRepositoryImpl` can be used wherever `MovieRepository` is expected.
- **Interface Segregation Principle (ISP)**: Interfaces are small and specific to client needs.
  - Example: The `MovieRepository` interface defines only the methods required for movie-related operations.
- **Dependency Inversion Principle (DIP)**: High-level modules depend on abstractions, not concrete implementations.
  - Example: The `MovieCubit` depends on the `MovieRepository` interface, not its implementation.

### 2. **Repository Pattern**
The project uses the Repository Pattern to abstract data access logic.
- Example: `MovieRepository` is an abstraction that defines methods like `getMovies()`.
- `MovieRepositoryImpl` implements this interface and fetches data from the TMDb API.

### 3. **Clean Architecture**
The project follows Clean Architecture principles by separating concerns into layers:
- **Presentation Layer**: Handles UI and user interaction.
- **Domain Layer**: Contains business logic and use cases.
- **Data Layer**: Manages data sources and APIs.

### 4. **State Management Patterns**
- **Cubit Pattern**: The `movie_cubit.dart` file demonstrates the use of the Cubit pattern for state management (a simplified version of the Bloc pattern with less boilerplate).
- **Bloc/Cubit Architecture**: The application follows the separation of UI, business logic, and events/states that is central to the bloc library approach.
- **Factory Pattern**: Used for creating objects.
  - Example: A factory method might be used to create instances of `Movie` from JSON data.

## Example Code References

- **API Service**: `movie_client.dart` contains methods for interacting with TMDb API.
- **Repository**: `movie_repository_impl.dart` implements the `MovieRepository` interface.
- **UI**: `movie_page.dart` displays the list of movies fetched from the API.

## How to Run

1. Navigate to the project folder:
   ```bash
   cd /Users/stanislavpetkov/StudioProjects/flutter_architectures_and_state_management_projects/movie_list
   ```

2. Fetch dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```
