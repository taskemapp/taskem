.PHONY: clean pub-get build-runner slang

clean:
	@echo "╠ Cleaning the project..."
	@rm -rf pubspec.lock
	@flutter clean

pub-get:
	@flutter pub get

runner:
	@flutter pub run build_runner build --delete-conflicting-outputs

build-apk:
	@flutter build apk --release --dart-define-from-file=.env

slang:
	@dart run slang

#   protoc --dart_out=grpc:lib/generated -Iprotos proto/auth.proto google/protobuf/timestamp.proto google/protobuf/empty.proto