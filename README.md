# dfa_shop

A test Flutter project for DFA Media company.

## Getting Started
first, run:

``` dart pub get ```

then, generate all necessities with:

``` dart run build_runner build --delete-conflicting-outputs ```

and you are good to go!

## Launch the app
the app consists of a WebSocket server (located in /server) and the mobile app (located in /lib).
If you are launching on an emulator, you should launch the server first do it with:

``` dart run server/message_server.dart ```

otherwise it wont work as fully intended.
and then launch flutter app using standart command:

``` flutter run ```

Dont` forget to connect your emulator/device!