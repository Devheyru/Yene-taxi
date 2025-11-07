plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}
dependencies {
  // Import the Firebase BoM
  implementation(platform("com.google.firebase:firebase-bom:34.5.0"))


  // TODO: Add the dependencies for Firebase products you want to use
  // When using the BoM, don't specify versions in Firebase dependencies
  // https://firebase.google.com/docs/android/setup#available-libraries
}

android {
    namespace = "com.example.yene_taxi"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // Application ID (change for production if needed)
        applicationId = "com.example.yene_taxi"
        // Raise minSdk to 23 to satisfy firebase_auth and related plugin requirements.
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Replace with real keystore for production builds.
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    // Align NDK version with Firebase/Geolocator plugin requirements.
    ndkVersion = "27.0.12077973"
}

flutter {
    source = "../.."
}
