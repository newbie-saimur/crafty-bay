# 🛍️ Crafty Bay

A modern, feature-rich e-commerce mobile application built with Flutter, offering a seamless shopping experience with Firebase integration for crash reporting and analytics.

## 📥 Download APK

Experience the app without setting up the development environment:

**[📱 Download Android APK](ui_images/app-release.apk)**

*Note: Enable "Install from Unknown Sources" in your Android settings to install the APK.*

## 📱 Features

### Authentication
- Email & OTP verification system
- Secure user login and registration
- Session management with token-based authentication

### Product Browsing
- Product catalog with categories
- Product details with image carousel
- Color and size variants
- Search functionality
- Product filtering

### Shopping Experience
- Add to cart functionality
- Wishlist/Favorites
- Product reviews and ratings
- Special offers and new arrivals
- Popular products section

### UI/UX
- Hero banner carousel on home screen
- Smooth animations and transitions
- Responsive design
- Bottom navigation bar
- Custom app theme with brand colors
- OTP input fields for verification

### Technical Features
- Firebase Crashlytics for error tracking
- GetX state management
- RESTful API integration
- Image caching and error handling
- Currency formatting with comma separators
- Network request handling with custom NetworkClient

## 📸 Screenshots

<div align="center">
  <table>
    <tr>
      <td><img src="ui_images/home.png" width="250" alt="Home Screen"/></td>
      <td><img src="ui_images/home-2.png" width="250" alt="Home Screen 2"/></td>
      <td><img src="ui_images/category-list.png" width="250" alt="Category List"/></td>
    </tr>
    <tr>
      <td align="center"><b>Home Screen</b></td>
      <td align="center"><b>Home Screen 2</b></td>
      <td align="center"><b>Category List</b></td>
    </tr>
    <tr>
      <td><img src="ui_images/product-list.png" width="250" alt="Product List"/></td>
      <td><img src="ui_images/cart.png" width="250" alt="Shopping Cart"/></td>
      <td><img src="ui_images/wish-list.png" width="250" alt="Wishlist"/></td>
    </tr>
    <tr>
      <td align="center"><b>Product List</b></td>
      <td align="center"><b>Shopping Cart</b></td>
      <td align="center"><b>Wishlist</b></td>
    </tr>
    <tr>
      <td><img src="ui_images/login.png" width="250" alt="Login Screen"/></td>
      <td><img src="ui_images/signup.png" width="250" alt="Sign Up Screen"/></td>
      <td><img src="ui_images/otp-verification.png" width="250" alt="OTP Verification"/></td>
    </tr>
    <tr>
      <td align="center"><b>Login Screen</b></td>
      <td align="center"><b>Sign Up Screen</b></td>
      <td align="center"><b>OTP Verification</b></td>
    </tr>
  </table>
</div>

## 🏗️ Architecture

The project follows a clean architecture pattern with feature-based modularization:

```
lib/
├── app/                    # App configuration
│   ├── app.dart           # Main app widget
│   ├── app_colors.dart    # Color palette
│   ├── app_theme.dart     # Theme configuration
│   └── asset_paths.dart   # Asset path constants
├── core/                   # Core utilities
│   ├── network/           # Network client & API services
│   ├── storage/           # Local storage
│   └── utils/             # Helper functions
├── features/              # Feature modules
│   ├── auth/             # Authentication
│   ├── home/             # Home screen
│   ├── product/          # Product listing & details
│   ├── cart/             # Shopping cart
│   ├── wish-list/        # Wishlist
│   └── common/           # Shared widgets & controllers
├── routes/               # Navigation routing
├── firebase_options.dart # Firebase configuration
└── main.dart            # App entry point
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (^3.10.4)
- Dart SDK (^3.10.4)
- Android Studio / VS Code
- Firebase account

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/crafty_bay.git
   cd crafty_bay
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Add Android/iOS apps to your Firebase project
   - Download and place `google-services.json` in `android/app/`
   - Download and place `GoogleService-Info.plist` in `ios/Runner/`
   - Run Firebase CLI configuration:
     ```bash
     flutterfire configure
     ```

4. **Run the app**
   ```bash
   flutter run
   ```

## 📦 Dependencies

### Core
- **flutter_sdk**: Flutter framework
- **get** (^4.7.3): State management and routing
- **http** (^1.6.0): HTTP requests
- **shared_preferences** (^2.5.4): Local storage

### UI
- **flutter_svg** (^2.2.3): SVG image support
- **carousel_slider** (^5.1.1): Image carousels
- **pin_code_fields** (^8.0.1): OTP input fields
- **cupertino_icons** (^1.0.8): iOS-style icons

### Utilities
- **intl** (^0.20.2): Internationalization and formatting
- **logger** (^2.6.2): Enhanced logging

### Firebase
- **firebase_core** (^4.3.0): Firebase initialization
- **firebase_crashlytics** (^5.0.6): Crash reporting

### Development
- **device_preview** (^1.3.1): Test UI on different devices
- **flutter_lints** (^6.0.0): Linting rules

## 🎨 Design Patterns

- **State Management**: GetX for reactive state management
- **Dependency Injection**: GetX bindings for controller lifecycle
- **Repository Pattern**: Separation of data sources
- **Observer Pattern**: Reactive UI updates
- **Singleton Pattern**: Network client and shared services

## 🔧 Configuration

### API Configuration
Update your API base URL in the NetworkClient configuration.

### Theme Customization
Modify `lib/app/app_colors.dart` and `lib/app/app_theme.dart` to customize the app's appearance.

### Assets
Place images in `assets/images/` and update `pubspec.yaml` accordingly.

## 📱 Supported Platforms

- ✅ Android
- ✅ iOS

## 🧪 Testing

Run tests with:
```bash
flutter test
```

## 🏗️ Build

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## 📝 API Integration

The app integrates with a RESTful API for:
- User authentication
- Product catalog
- Cart management
- Order processing
- Wishlist management

Authentication is handled via bearer tokens stored securely in SharedPreferences.

## 🔐 Security Features

- Token-based authentication
- Automatic session management
- Secure API communication
- Firebase Crashlytics for monitoring
- Error boundary handling

## 🐛 Error Handling

- Network error handling with fallback images
- Firebase Crashlytics integration for crash reporting
- User-friendly error messages
- Null-safety throughout the codebase

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👥 Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📧 Contact

Project Link: [https://github.com/yourusername/crafty_bay](https://github.com/yourusername/crafty_bay)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- GetX package for state management
- Firebase for backend services
- All open-source contributors

---

**Made with ❤️ using Flutter**

