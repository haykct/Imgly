#  Imgly

A project that shows a list of records.

#  Description

This app shows a list of records and detailed informartion about those records.

#  Getting started

1. Make sure you have the Xcode version 14.0 or above installed on your computer.
2. Download the Imgly project files from the repository.
3. Open the project files in Xcode.
4. Review the code and make sure you understand what it does.
5. Run the active scheme.

#  Usage

#### Navigation

* After runnig the app you can see the list of the companies.
* Tap on one of the list items and the app will navigate you to a list of workspaces.
* Tap on one of the list items again and it will show you the entries.
* This is the basic tree structure of the list page but it may change.
* Tap on one of the entries and the app will present a detailed information about that entry.

#### Actions

* You can move and delete all the items in the list.
* To move items tap on the Edit button on the right side of the navigation bar.
* In edit mode you can drag an item and replace it.
* To delete items tap on the Edit button again.
* In edit mode you can delete an item by tapping on the left '-' sign.
* You can also delete an item by simply swiping it from right to left.
* To change the theme of the app tap on the button in the lower right corner.
* This will open a settings screen where you can select different colors.
* On the detail page the button will automatically disappear so as not to interfere with the text.
* You can show and hide it by tapping on the screen.

# Architecture

* Imgly project is implemented using the Model-View-ViewModel (MVVM) architecture pattern.
* Model has any necessary data or business logic needed to show the list and detail records.
* View is responsible for displaying the data to the user and leting him to interact with it.
* ViewModel is responsible for converting the data objects from the model in such a way they can be easily managed and presented.
* Project doesn't have a database.

# Dependencies

* 'Alamofire' networking library that ensures that the message reaches everyone in the world.
* 'Mocker' is a third party lib to help easily implement various tests.
* 'Swinject' is a dependency injection framework that allows you to get loosely-coupled components in your app.

