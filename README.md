# 🍲 Mitho Deals - Rescuing Food, Sharing Joy

**Mitho Deals** is a food waste management application inspired by mission-driven apps like ResQ Club. Our goal is to reduce food waste in Nepal by connecting restaurants, bakeries, and cafes (Vendors) with eco-conscious consumers.

Vendors can sell surplus, unsold food at heavily discounted prices near closing time, and users can find these "Mitho" (delicious) deals to pick up.

---

## 🚀 Key Features

- **🔐 Robust Authentication**: Support for Email/Password and Phone OTP via Supabase Auth.
- **📍 Nearby Deals**: Interactive Map and List views to find surplus food based on your current location.
- **🕒 Time-Based Pickups**: Smart scheduling with strict `pickupStartTime` and `pickupEndTime`.
- **📦 Real-time Inventory**: Live tracking of `availablePortions` to prevent overbooking.
- **🏪 Vendor Dashboard**: Easy-to-use interface for restaurants to post deals in seconds.
- **📜 Order History**: Track all your rescued meals and generated pickup codes.

---

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev/) (Cross-platform excellence)
- **Backend-as-a-Service**: [Supabase](https://supabase.com/) (Auth, PostgreSQL, Real-time)
- **State Management**: [BLoC](https://pub.dev/packages/flutter_bloc) (Predictable state transitions)
- **Navigation**: [GoRouter](https://pub.dev/packages/go_router) (Declarative routing)
- **Local Config**: [Flutter Dotenv](https://pub.dev/packages/flutter_dotenv)
- **UI & Generation**:
  - [Freezed](https://pub.dev/packages/freezed) & [JSON Serializable](https://pub.dev/packages/json_serializable) (Immutable models)
  - [Google Fonts](https://fonts.google.com/) & [Flutter ScreenUtil](https://pub.dev/packages/flutter_screenutil) (Responsive & beautiful typography)

---

## 🏛️ Architecture & Methodology

The project strictly follows **Feature-Driven Clean Architecture**. This ensures the codebase is scalable, testable, and maintainable.

### Layers
- **📁 Data**: Models, Datasources, and Repository Implementations (Supabase interaction).
- **📁 Domain**: Pure Dart Entities, Use Cases, and Repository Interfaces (Business Logic).
- **📁 Presentation**: BLoC, Pages, and Widgets (UI logic).

### Core Features
1. `auth/` - Supabase login, registration, and OTP logic.
2. `deals/` - Map/List views and deal fetching logic.
3. `orders/` - Transaction history and claim management.
4. `vendor/` - Restaurant-specific dashboard for deal creation.
5. `cart/` - Reservation staging and checkout.
6. `profile/` - User preferences and account management.

---

## ⚙️ Setup Instructions

### 1. Prerequisites
- Flutter SDK (latest stable)
- Supabase Project

### 2. Environment Variables
Create a `.env` file in the root directory and add your Supabase credentials:
```env
PROJECT_URL=your_supabase_project_url
API_KEY=your_supabase_anon_key
```

### 3. Supabase Tables (SQL)
Run the following SQL in your Supabase SQL Editor to set up the schema:

```sql
-- Tables for vendors, deals, and orders
CREATE TABLE vendors (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  address TEXT NOT NULL,
  latitude DOUBLE PRECISION NOT NULL,
  longitude DOUBLE PRECISION NOT NULL,
  owner_id UUID REFERENCES auth.users(id)
);

CREATE TABLE deals (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  vendor_id UUID REFERENCES vendors(id) ON DELETE CASCADE,
  food_name TEXT NOT NULL,
  original_price DOUBLE PRECISION NOT NULL,
  discounted_price DOUBLE PRECISION NOT NULL,
  available_portions INTEGER NOT NULL DEFAULT 1,
  pickup_start_time TIMESTAMPTZ NOT NULL,
  pickup_end_time TIMESTAMPTZ NOT NULL,
  is_available BOOLEAN DEFAULT true
);
```

### 4. Code Generation
If you modify models or events, run build_runner:
```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## 🏗️ Project Structure
```text
lib/
├── app/                  # Routing & Themes
├── core/                 # DI, Errors, Services
├── features/             # Core Business Features (Clean Arch)
│   ├── auth/
│   ├── deals/
│   └── ...
├── shared/               # Global Widgets & Utils
└── main.dart             # Entry point
```

---

*Made with ❤️ to reduce food waste.*
