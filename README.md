# RSS Reader Pro
[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/ahmedshaban-blip/RSS-Reader)

An elegant, modern RSS feed reader application built with Flutter. This application allows users to fetch, parse, and display articles from any valid RSS feed URL. It features a clean, animated user interface and is structured following Clean Architecture principles for scalability and maintainability.

## Screenshots

<p align="center">
  <img src="assets/screenshots/app_preview.png" alt="RSS Reader App Screenshots" width="100%">
</p>

## Features

- **Fetch from URL**: Enter any valid RSS feed URL to load its content.
- **Article Listing**: View articles in a paginated, scrollable list, each with a title, publication date, and featured image.
- **Detailed View**: Tap on an article to see its full description in a beautifully designed detail screen.
- **Image Parsing**: Automatically extracts and displays the primary image from each RSS item, with fallbacks for content, thumbnails, and enclosures.
- **Pagination**: Efficiently loads a large number of articles using a "Load More" button.
- **Web Browser Integration**: Open the full article in an external web browser.
- **Share Functionality**: Easily share interesting articles with others.
- **Modern UI/UX**: A smooth and visually appealing interface, featuring gradients, custom clippers, and animations.

## Architecture

The project is structured using principles of **Clean Architecture** to separate concerns and ensure the codebase is modular, testable, and scalable. The core logic is divided into three main layers:

- **Presentation**: Contains the Flutter UI, including pages, widgets, and state management logic.
  - `pages`: Screens for user interaction (e.g., `RssInputPage`, `RssListPage`).
  - `widgets`: Reusable UI components.
  - `logic/cubit`: Manages the state of the UI using the `flutter_bloc` package. `RssCubit` handles the application's state and business logic.

- **Data**: Responsible for data retrieval and management.
  - `repositories`: Implements the `RssRepository`, which fetches and parses the RSS feed from the network.
  - `models`: Defines the data structures, such as `RssItem`.

### State Management

State management is handled using **Bloc (Cubit)** pattern, which provides a predictable state lifecycle and separates business logic from the UI.

- **`RssCubit`**: Manages fetching the feed, handling loading states, errors, pagination, and providing the UI with a stream of states (`RssInitial`, `RssLoading`, `RssLoaded`, `RssError`).

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

- Flutter SDK: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
- A code editor like VS Code or Android Studio.

### Installation

1.  **Clone the repository:**
    ```sh
    git clone [https://github.com/ahmedshaban-blip/rss-reader.git](https://github.com/ahmedshaban-blip/rss-reader.git)
    ```

2.  **Navigate to the project directory:**
    ```sh
    cd rss-reader
    ```

3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```

4.  **Run the application:**
    ```sh
    flutter run
    ```

## Key Dependencies

- `flutter_bloc`: For state management.
- `http`: For making network requests to fetch the RSS feed.
- `xml`: For parsing the XML data from the RSS feed.
- `url_launcher`: To open article links in an external browser.
- `share_plus`: For sharing article links.
- `equatable`: To simplify equality comparisons in Bloc states.
