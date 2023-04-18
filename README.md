# multi_vendor

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# FireBase:
=> read from => https://firebase.flutter.dev/
it connect with ecommerce-tarek db
[1] authentication:
- use both email && google && phone

[2] cloud fire store
- test mode
** change rule of both cloud and storage => to allow r*w every time == allow read, write;
-- collection --
    a. vendors :
        email,
    b. banners => image => from store tokens we get its path


-- upload banners 
1. from firebase
    - storage -> create folder, inside Banners folder => then upload fiels
    - open a new tab of cloud =>
        -- make banners collection => image, get its location [copy token ]from your storage
            and paste as String for your image
        -- make function and list to recive them on banners page
2. admain panel