# 🐱 CatApp

CatApp is a **SwiftUI** app built using the **MVVM** architecture. It fetches a list of cats from **The Cat API** and includes infinite scrolling and a detailed view for each cat.

## 📌 Features
- 🏗 **MVVM architecture** for a clean and scalable code structure.
- 🔄 **Infinite scrolling** to load more cats dynamically.
- 🐈 **Detail screen** showing breed information.
- 🌐 **Optimized API calls** using `URLSession`.
- ✅ **Well-structured and tested code** with `XCTest`.

---

## 📂 Project Structure
```
CatApp/
│── CatsApp.swift          # App entry point (@main)
│
├── Models/                  # Data models
│   ├── CatModels.swift            # Main Cat model
│
├── ViewModels/              # Business logic
│   ├── CatListViewModel.swift  # ViewModel for the cat list
│   ├── CatDetailViewModel.swift  # ViewModel for cat details
│
├── Views/                   # UI components
│   ├── CatListView.swift     # Screen displaying a list of cats
│   ├── CatDetailView.swift   # Screen showing cat details
│
├── Networking/              # API handling
│   ├── ApiService.swift      # Handles HTTP requests
│
├── Tests/                   # Unit tests
│   ├── CatListViewModelTests.swift  # Tests for CatListViewModel
```

---

## 🔧 Setup & Installation
### **1️⃣ Requirements**
- 🛠 **Xcode 15+**
- 🐦 **Swift 5.7+**
- 📡 **Internet connection**

### **2️⃣ Clone the Repository**
```bash
git clone https://github.com/your-username/CatApp.git
cd CatApp
```

### **3️⃣ Set Up Your API Key**
1. Sign up at [The Cat API](https://thecatapi.com/).
2. Get your free API Key.
3. Open `ApiService.swift` and replace:
   ```swift
   private let apiKey = "YOUR_API_KEY"
   ```

### **4️⃣ Run the App**
Open `CatApp.xcodeproj` in Xcode and press **Cmd + R** to run it.

---

## 📦 Dependencies
This project is built using native frameworks (`URLSession`, `SwiftUI`, and `Combine`) without external dependencies.

---

## 🧪 Running Tests
### **Run Unit Tests**
1. Open the project in Xcode.
2. Select the `CatAppTests` scheme.
3. Press **Cmd + U** to run the tests.

---

## 🚀 Future Improvements
- 🔍 **Search by breed**
- ⭐ **Save favorites** using `UserDefaults` or `CoreData`
- 🖼 **Better image handling** with `Kingfisher`

---

## 📜 License
This project is licensed under **MIT**. Feel free to use and improve it! 🎉
