<p align="center">
  <img src="https://cdn-icons-png.flaticon.com/512/6295/6295417.png" width="100" />
</p>
<p align="center">
    <h1 align="center">EXAMPLE ARCH</h1>
</p>
<p align="center">
	<img src="https://img.shields.io/github/license/mertcanerbasi/examplearch?style=flat&color=0080ff" alt="license">
	<img src="https://img.shields.io/github/last-commit/mertcanerbasi/examplearch?style=flat&logo=git&logoColor=white&color=0080ff" alt="last-commit">
	<img src="https://img.shields.io/github/languages/top/mertcanerbasi/examplearch?style=flat&color=0080ff" alt="repo-top-language">
	<img src="https://img.shields.io/github/languages/count/mertcanerbasi/examplearch?style=flat&color=0080ff" alt="repo-language-count">
<p>
<p align="center">
		<em>Developed with the software and tools below.</em>
</p>
<p align="center">
	<img src="https://img.shields.io/badge/Swift-F05138.svg?style=flat&logo=Swift&logoColor=white" alt="Swift">
	<img src="https://img.shields.io/badge/YAML-CB171E.svg?style=flat&logo=YAML&logoColor=white" alt="YAML">
	<img src="https://img.shields.io/badge/C-A8B9CC.svg?style=flat&logo=C&logoColor=black" alt="C">
	<img src="https://img.shields.io/badge/Kotlin-7F52FF.svg?style=flat&logo=Kotlin&logoColor=white" alt="Kotlin">
	<img src="https://img.shields.io/badge/Org-77AA99.svg?style=flat&logo=Org&logoColor=white" alt="Org">
	<br>
	<img src="https://img.shields.io/badge/GitHub%20Actions-2088FF.svg?style=flat&logo=GitHub-Actions&logoColor=white" alt="GitHub%20Actions">
	<img src="https://img.shields.io/badge/Gradle-02303A.svg?style=flat&logo=Gradle&logoColor=white" alt="Gradle">
	<img src="https://img.shields.io/badge/Dart-0175C2.svg?style=flat&logo=Dart&logoColor=white" alt="Dart">
	<img src="https://img.shields.io/badge/JSON-000000.svg?style=flat&logo=JSON&logoColor=white" alt="JSON">
	<img src="https://img.shields.io/badge/JetBrains-000000.svg?style=flat&logo=JetBrains&logoColor=white" alt="JetBrains">
</p>
<hr>

##  Overview

 > - Bu proje Örnek ve template Proje olması için yapılmıştır.
 > - Proje genel hatlarıyla MVVM mimarisinde, ChangeNotifier ile state management yapılan, default Navigator classı üzerine yazılan RouteMap(Kendi geliştirmem) ile navigasyon işlemleri sağlanan, Repository Pattern ile ApiService-Repository ayrımı yapılarak ilerlenen Ingilizce Türkçe desteği bulunan bir case uygulamasıdır.

---

##  Features
#Firebase özellikleri example repo olduğu için sahte kurulumludur. Geliştiricinin kendi firebase bağlantısını tekrar yapması gerekmektedir.

> - Firebase Crashlytics
> - Firestore
> - Repository Pattern
> - Retrofit
> - Firebase Remote Config
> - GetIt
> - GetStorage (Local Data Storage)
> - Injectable
> - MVVM

---

##  Repository Structure

```sh
└── examplearch/
    ├── l10n.yaml
    ├── lib
    │   ├── app
    │   │   ├── data
    │   │   │   ├── model
    │   │   │   │   ├── app_remote_config
    │   │   │   │   ├── error_model
    │   │   │   │   ├── get_products_response
    │   │   │   │   ├── login_request
    │   │   │   │   └── user
    │   │   │   ├── repository
    │   │   │   │   ├── auth_repository.dart
    │   │   │   │   └── product_repository.dart
    │   │   │   └── service
    │   │   │       ├── api_service.dart
    │   │   │       └── api_service.g.dart
    │   │   ├── presentation
    │   │   │   ├── app
    │   │   │   │   ├── app.dart
    │   │   │   │   └── app.vm.dart
    │   │   │   ├── auth
    │   │   │   │   ├── login.dart
    │   │   │   │   └── login.vm.dart
    │   │   │   ├── home
    │   │   │   │   ├── home.dart
    │   │   │   │   ├── home.vm.dart
    │   │   │   │   └── home_widgets
    │   │   │   ├── root
    │   │   │   │   ├── root_page.dart
    │   │   │   │   └── root_page.vm.dart
    │   │   │   └── splash
    │   │   │       └── splash.dart
    │   │   └── router
    │   │       ├── app_router.dart
    │   │       └── app_router.routes.dart
    │   ├── bootstrap.dart
    │   ├── core
    │   │   ├── base
    │   │   │   ├── base_view_model.dart
    │   │   │   └── base_widget.dart
    │   │   ├── config.dart
    │   │   ├── di
    │   │   │   ├── app_module.dart
    │   │   │   ├── locator.config.dart
    │   │   │   └── locator.dart
    │   │   ├── interceptor
    │   │   │   ├── error_interceptor.dart
    │   │   │   ├── log_interceptor.dart
    │   │   │   └── token_interceptor.dart
    │   │   ├── local_data_source
    │   │   │   └── local_data_source.dart
    │   │   ├── logger.dart
    │   │   ├── res
    │   │   │   ├── colors.dart
    │   │   │   ├── dimens.dart
    │   │   │   ├── icons.dart
    │   │   │   ├── images.dart
    │   │   │   ├── l10n
    │   │   │   │   ├── app_en.arb
    │   │   │   │   └── app_tr.arb
    │   │   │   ├── local_key_constants.dart
    │   │   │   ├── text_style.dart
    │   │   │   └── theme.dart
    │   │   ├── util
    │   │   │   ├── context_ex.dart
    │   │   │   ├── object_ex.dart
    │   │   │   ├── siren.dart
    │   │   │   ├── turkish.dart
    │   │   │   ├── validators.dart
    │   │   │   └── widget_ex.dart
    │   │   └── widget
    │   │       ├── app_dialog.dart
    │   │       ├── force_update_page.dart
    │   │       ├── forgot_password_widget.dart
    │   │       ├── gradient_text.dart
    │   │       ├── horizontal_item_card_widget.dart
    │   │       ├── image_network.dart
    │   │       ├── info_message.dart
    │   │       ├── loading.dart
    │   │       ├── loading_dialog.dart
    │   │       ├── specialized_buttons.dart
    │   │       ├── unknown.dart
    │   │       └── vertical_item_card_widget.dart
    │   ├── firebase_options.dart
    │   ├── main_development.dart
    │   ├── main_production.dart
    │   └── main_staging.dart
    ├── pubspec.yaml
    └── test
        └── unit
            └── product_repo_test.dart
```

##  Getting Started

***Requirements***

Ensure you have the following dependencies installed on your system:

* **Dart**: `version 3.4.3`
* **Flutter**: `version 3.22.2`

###  Installation

1. Clone the examplearch repository:

```sh
git clone https://github.com/mertcanerbasi/examplearch
```

2. Change to the project directory:

```sh
cd examplearch
```

3. Install the dependencies:

```sh
flutter clean
flutter pub get
flutter gen-l10n
```
4. Generate Files With Buildrunner
```sh
flutter pub run build_runner build --delete-conflicting-outputs
```
5. Running Project with Flavors (Dev-Prod-Stage)
```sh
flutter run --flavor development --target lib/main_development.dart
flutter run --flavor staging --target lib/main_staging.dart
flutter run --flavor production --target lib/main_production.dart
```
5. Generating Build File with Flavor
```sh
android build apk

flutter build apk --flavor development --target lib/main_development.dart
flutter build apk --flavor staging --target lib/main_staging.dart
flutter build apk --flavor production --target lib/main_production.dart 

android build appbundle

flutter build appbundle --flavor development --target lib/main_development.dart
flutter build appbundle --flavor staging --target lib/main_staging.dart
flutter build appbundle --flavor production --target lib/main_production.dart

ios build ipa

flutter build ipa --flavor development --target lib/main_development.dart
flutter build ipa --flavor staging --target lib/main_staging.dart
flutter build ipa --flavor production --target lib/main_production.dart 
```

## CI/CD Pipeline 

## Prerequisites

1.  Flutter SDK
2.  GitHub repository with GitHub Actions enabled
3.  Java 17 installed (for Android build)

## Generate a Keystore

1. If you haven't already generated a keystore, follow these steps to create one. This keystore will be used to sign your Android app for release.

```sh
keytool -genkey -v -keystore ~/path/to/my-release-key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias my-app-key 
```

~/path/to/my-release-key.jks: The path where the keystore will be saved.

my-app-key: The alias for your key.

You will be prompted for the keystore and key passwords. Remember these values for later steps.


## Base64 Encode Your Keystore

1.  Since GitHub Secrets only supports text data, you need to encode the keystore into Base64 so it can be securely stored in the repository secrets.

For macOS/Linux:
```sh
    base64 ~/path/to/my-release-key.jks > my-release-key.jks.base64
```

For Windows (PowerShell):
```sh
    [Convert]::ToBase64String([IO.File]::ReadAllBytes("C:\path\to\my-release-key.jks")) > my-release-key.jks.base64
```

Open the generated my-release-key.jks.base64 file and copy its contents.

## Add Secrets to Github

Go to your GitHub repository, navigate to Settings > Secrets and variables > Actions, and create the following secrets:

```sh
Secret_Name	                            Description
ANDROID_KEYSTORE_BASE64	                    The Base64-encoded content of the my-release-key.jks file.
ANDROID_KEYSTORE_ALIAS	                    The alias for the key you created (e.g., my-app-key).
ANDROID_KEYSTORE_PRIVATE_KEY_PASSWORD	    The password for the private key inside the keystore.
ANDROID_KEYSTORE_PASSWORD	            The password for the keystore itself.
```

## Configure Github Actions Workflow

Copy the contents of that repositories .github/workflows/main.yaml and create that file


## Build the app locally
To build the APK or AppBundle locally, make sure you have a key.properties file in your android folder with the following structure:

```sh
storePassword=your-keystore-password
keyPassword=your-key-password
keyAlias=my-app-key
storeFile=/path/to/my-release-key.jks
```

then run build functions.


## CI/CD Pipeline
Once you push changes to the main branch or open a pull request, GitHub Actions will automatically:

Set up Java and Flutter.
Recreate the keystore from the Base64-encoded secret.
Build the app in release mode and sign it with the keystore.
Optionally upload the built AppBundle or APK as an artifact.
You can find the output in the Actions tab in your GitHub repository.






---

##  License

This project is protected under the [SELECT-A-LICENSE](https://choosealicense.com/licenses) License. For more details, refer to the [LICENSE](https://choosealicense.com/licenses/) file.

---

##  Acknowledgments

- List any resources, contributors, inspiration, etc. here.

[**Return**](#-quick-links)

---
