# GitHub Profile Search App

A Flutter app built with **MVVM architecture** and **Provider**, which allows users to search for GitHub profiles and view their public repositories. The app handles no internet connectivity gracefully and supports filtering of repositories.

##  Features

-  Search GitHub users by username.
-  View user profile information.
-  Display user's repositories.
-  Detects and handles no internet connection.
-  MVVM architecture.
-  Uses `Provider` for state management.
-  Custom filtering based on repository type (`all`, `owner`, `member`.).


## 🛠️ Tech Stack

- **Flutter**
- **Provider** for state management
- **HTTP** package for API requests
- **Connectivity Plus** for checking network status

### Installation

1. Clone the repo:

```bash
git clone https://github.com/your-username/github_profile_search.git
cd github_profile_search

flutter pub get


flutter run
```

##  Screenshots

###  Search Screen
![Search Screen](screenshots/home_screen.png)

###  Profile Screen
![Profile Screen](screenshots/profile_screen.png)



