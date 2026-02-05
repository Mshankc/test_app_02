# API Keys Setup

## Overview

This project uses sensitive API keys that should not be committed to version control. The API keys are stored in separate configuration files that are excluded from git.

## Setup Instructions

### iOS

1. Copy the template file:
   ```bash
   cp ios/Runner/ApiKeys.swift.template ios/Runner/ApiKeys.swift
   ```

2. Open `ios/Runner/ApiKeys.swift` and replace the placeholder with your actual Google Maps API key:
   ```swift
   static let googleMapsApiKey = "YOUR_ACTUAL_API_KEY_HERE"
   ```

### Android

If you need to add API keys for Android in the future, follow a similar pattern:
1. Create `android/app/src/main/res/values/api_keys.xml`
2. Add your keys there
3. The file is already in `.gitignore`

## Important Notes

- ✅ `ApiKeys.swift.template` - This is committed to git as a reference
- ❌ `ApiKeys.swift` - This contains your actual keys and is **NOT** committed to git
- The `.gitignore` file ensures sensitive keys are never accidentally committed

## Current API Keys

- **Google Maps API Key** - Used for map functionality in the app
  - iOS: `ios/Runner/ApiKeys.swift`
  - Referenced in: `ios/Runner/AppDelegate.swift`
