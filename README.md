# Multi-Portal Training Management System

A Flutter (Web + Android) starter architecture for a role-based training management platform with Firebase Authentication + Cloud Firestore, using a Repository + Controller + Screen pattern with Riverpod.

## Portals

- **Deled (Admin):** Training/session setup, trainer assignment, school/trainer management, attendance/report monitoring.
- **Walkro:** District/school visibility, attendance insights, report export.
- **Trainer:** Assigned schools, attendance marking, absent students logging, session photo upload, daily remarks/reports.
- **School:** Trainer visit tracking, attendance and absentee visibility, session notes/photos, report download.

## Architecture

- **Presentation layer:** Screens/widgets only.
- **Application layer:** Riverpod controllers + use-case coordination.
- **Data layer:** Repository implementations around Firebase services.
- **Core layer:** Shared app router, theme, utilities.

## Firebase collections (suggested)

- `users` (role, profile, linked school/district/trainer metadata)
- `districts`
- `schools`
- `trainers`
- `sessions`
- `attendance_records`
- `daily_reports`

## Role model

`user.role` determines portal landing page:

- `admin` → Deled portal
- `walkro` → Walkro portal
- `trainer` → Trainer portal
- `school` → School portal

## Quick start

1. Create Firebase project and add Web + Android apps.
2. Configure `firebase_options.dart` using FlutterFire CLI.
3. Enable Email/Password authentication.
4. Add Firestore security rules based on role checks.
5. Run:

```bash
flutter pub get
flutter run -d chrome
```

## Next implementation tasks

- Add real Firebase repositories and Firestore schema mapping.
- Implement attendance + daily report CRUD.
- Add PDF export service per portal.
- Add responsive layouts for mobile/tablet/web breakpoints.
