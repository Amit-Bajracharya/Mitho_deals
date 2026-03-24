# Mitho Deals - App Blueprint & Architecture

## 📱 App Concept
**Mitho Deals** is a "ResQ Club"-style food waste management application. The core mission is to reduce food waste by allowing restaurants, bakeries, and cafes (Vendors) to sell their surplus, unsold food at heavily discounted prices near their closing time. Users (Consumers) can buy this food via the app and pick it up during specified time windows.

## 🏛️ Architecture & Folder Structure
The app strictly follows **Feature-Driven Clean Architecture** and must continuously match the exact folder groupings established in your `app_structure.txt` file.

### Inside `lib/` in the root folder:
- **`app/`**: Routing configuration (GoRouter) and UI Themes (`app_theme.dart`).
- **`core/`**: Abstractions (`usecase.dart`), error handling (`failures.dart`), utilities, and string extensions.
- **`shared/`**: Global widgets (CustomButtons) and global-level services (`supabase_service.dart`, `location_service.dart`).
- **`features/`**: The heart of the app. Every single feature MUST contain a `data`, `domain`, and `presentation` layer folder.

### 🍱 The App's Features
As outlined in `app_structure.txt`, the UI and logic are split into 6 core features:
1. `auth/` - Supabase login/registration state & screens.
2. `deals/` - The core lists (`deals_list_screen.dart`), the map (`deals_map_screen.dart`), and deal fetching logic.
3. `orders/` - The transaction history of food reserved by a user.
4. `vendor/` - The specific dashboard allowing a restaurant to post surplus food.
5. `cart/` - Active selections before reservation checkout.
6. `profile/` - User account and preferences.

---

## 🗺️ Core Mechanics
1. **Time-Based Deals**: Deals have strict `pickupStartTime` and `pickupEndTime` rules.
2. **Maps Integration**: Consumers view deals on a Map based on proximity (Latitude/Longitude from VendorEntity).
3. **Transaction Safety**: Strict reservation rules to prevent double-booking of limited `availablePortions`.

---

## 🧬 Core Domain Entities

These pure Dart Entities represent our app's core data structure.

### 1. Vendor Entity
Represents the restaurant posting the surplus food.
```dart
class VendorEntity {
  final String id;
  final String name;
  final String description;
  final String logoUrl;
  final double latitude;   // Crucial for Deals Map Integration
  final double longitude;  // Crucial for Deals Map Integration
  final String address;
  final double rating;
  final bool isOpen;

  // Constructor logic
}
```

### 2. Deal Entity
Represents the discounted surplus food being sold.
```dart
class DealEntity {
  final String id;
  final String vendorId;   // Links back to the VendorEntity
  final String foodName;
  final String description;
  final double originalPrice;
  final double discountedPrice;
  final int availablePortions;
  final DateTime pickupStartTime; 
  final DateTime pickupEndTime; 
  final String imageUrl;
  final bool isAvailable;

  // Constructor logic
}
```

### 3. User Entity (Consumer)
Represents the person rescuing the food.
```dart
class UserEntity {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String profilePictureUrl;
  
  // Constructor logic
}
```

### 4. Order / Claim Entity
Represents a transaction when food is claimed.
```dart
class OrderEntity {
  final String id;
  final String userId;     // Who bought it
  final String dealId;     // What they bought
  final String vendorId;   // Where they are picking it up
  final int quantity;      // How many boxes/plates they reserved
  final double totalAmount;
  final DateTime orderPlacedTime;
  final String status;     // e.g., 'reserved', 'picked_up', 'cancelled'
  final String pickupCode; // Unique generated code to show to Vendor

  // Constructor logic
}
```

---

## 🚀 AI Prompt Guide
When starting a new session or delegating a task, just copy/paste this prompt:
> *"I am building **Mitho Deals** (a food waste reduction app with maps) in Flutter. Please read `APP_BLUEPRINT.md` and `app_structure.txt` in the root folder to completely learn the exact Clean Architecture folder layout, feature lists, and Domain logic before writing any code."*
