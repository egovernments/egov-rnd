json:
	flutter pub run build_runner build --delete-conflicting-outputs

add:
	mkdir -p lib/features/$(name)
	mkdir lib/features/$(name)/controllers
	mkdir lib/features/$(name)/bindings
	mkdir lib/features/$(name)/pages

apk: 
	flutter build apk --release --no-tree-shake-icons

build:
	docker build -t route_map .

run:
	docker run -d -p 2205:80 --name route_map route_map

.PHONY: json add apk build run