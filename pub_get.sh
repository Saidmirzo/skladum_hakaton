flutter clean
rm -rf pubspec.lock

cd ios
pod deintegrate
rm -rf build
rm -rf Pods
rm -rf ios/Runner.xcworkspace
rm -rf Podfile.lock
rm -rf .symlinks
rm -Rf Flutter/Flutter.framework
rm -Rf Flutter/Flutter.podspec
pod cache clean --all
cd ..

flutter pub get

cd ios/
pod install
cd ..

#  get-graphql-schema https://vireapi-beta.designcode.agency/graphql > lib/app/graphql/schema.graphql
#get-graphql-schema http://localhost:5125/graphql > lib/app/graphql/schema.graphql
# dart run build_runner build --delete-conflicting-outputs
# dart run easy_localization:generate --source-dir assets/l10n --output-dir lib/common/res -f keys -o locale_keys.g.dart
