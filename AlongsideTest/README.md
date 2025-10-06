# 🎬 AlongsideTest – Movie Explorer App

**AlongsideTest** is a SwiftUI-based iOS application built using the MVVM architecture that showcases a list of popular movies from The Movie Database (TMDb) API. It supports offline caching, search functionality, and detailed views for individual movies.

---

## 📱 Features

- 🔍 **Popular Movies** – Fetch and display trending/popular movies using TMDb API.
- 💾 **Offline Support** – Local JSON caching for fallback when offline.
- 🔎 **Search** – Search movies by title with graceful fallback (`No data found`).
- 🧭 **Movie Detail** – Full-screen detail view with movie poster and release year.
- 🔁 **Pull-to-Refresh** – Refresh movie list via pull gesture.
- 🔃 **Orientation Toggle** – Toggle between vertical and horizontal layout view.
- 🧪 **Unit Testing** – Basic unit test setup via `AlongsideTestTests`.

---

## 🧱 Architecture

This project follows **MVVM (Model-View-ViewModel)** pattern:
- **Models**: `Movie.swift` – movie data structure.
- **ViewModels**: `MovieListViewModel.swift` – handles API, search, refresh, and caching logic.
- **Views**: 
  - `MovieListView.swift` – main list screen.
  - `MovieRowCardView.swift` – card layout for vertical display.
  - `MovieCardView.swift` – horizontal layout card.
  - `MovieDetailView.swift` – poster + metadata in scrollable view.

---

## 🔗 Dependencies

- ✅ Pure Swift/SwiftUI
- ✅ No external dependency manager used (Simplicity first)
- 📦 Combine (optional) for reactive state updates
- 📡 URLSession for networking

---

## 🛠️ Project Structure

```
AlongsideTest/
├── Models/
│   └── Movie.swift
├── ViewModels/
│   └── MovieListViewModel.swift
├── Views/
│   ├── MovieListView.swift
│   ├── MovieRowCardView.swift
│   ├── MovieCardView.swift
│   └── MovieDetailView.swift
├── Networking/
│   └── MovieService.swift
├── Utilities/
│   ├── movies.json         # Local cache fallback
│   └── LocalCache.swift    # JSON encode/decode to disk
└── AlongsideTestApp.swift
```

---

## Getting Started

### 1. Clone the repo

```bash
git clone https://github.com/Ruchit-Shah/AlongsideTest.git
cd AlongsideTest
```

### 2. Setup API Key

Replace your TMDb API key inside `MovieService.swift`:

```swift
let apiKey = "YOUR_API_KEY"
```

> ⚠️ You must have a valid TMDb API key to fetch movies.

### 3. Run the project

Open `AlongsideTest.xcodeproj` or `.xcworkspace` in **Xcode 14+**, and run on an iOS simulator or device.

---

## 🧪 Testing

Basic unit tests are included under:

```
AlongsideTestTests/
└── AlongsideTestTests.swift
```

To run tests:  
`Cmd + U` in Xcode.

---

## 📂 Offline Caching

- JSON is cached locally using `LocalCache.swift`.
- On launch, if no internet is available, fallback data from `movies.json` is used.

---

## 🧑‍💻 Author

**Ruchit Shah**  

---

## 📄 License

This project is open-sourced under the MIT License.
