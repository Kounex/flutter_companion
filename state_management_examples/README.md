# State Management Examples

Serves as a more advanced repo to showcase selected common state management solutions used for Flutter.

## Why State Management?

Even while using Flutter in its basic form and we want to update the UI to represent the current state of our values / models, we need to work with some kind of state management. It generally just means that we chose a way how to update our values / models (which are basically - combined - our app state) and our UI.

Flutter has two major kind of widgets: Stateless and Stateful widgets. Stateless widgets are used to represent something fixed (final) where we don't intend to explicitly update this widget if our state (values / models) changes. Stateful widgets on the other hand are intended to use if we know that this widget needs to be rebuild after our state has changed (for example a user name which is used in this widget) and we want this widget to show the current value instead of the one it has been initialized with.

Flutter provides us with the `setState(() {})` method for our Stateful widgets. This method can be called on those states and will trigger a rebuild so we can exactly tell our widget when it has to rebuild in order to display the current value. So usually after a value has been changed which is being displayed in this widget we call the `setState(() {})` method.

This can get tricky if the state a widget relies is not only used in this particular widget but throughout the app. An example would be a model like User. Usually we will refer to this user (its name, maybe age, nickname, whatever) in different views / widgets throughout the app and we want to always use the current value everywhere. So if we change a users name in a paticular Stateful widget, this changed state has to be used and displayed in other views / widgets as well. Using `setState(() {})` to achieve that will get veeeeery unhandy real quick.

Thats why we need a better solution.

## The chosen solutions

I chose three very common solutions which offer great benefits in comparison to the default `setState(() {})` method. There are indeed way more solutions out there - some of them share the same approach but have different use flows etc. [There is a very detailed repo](https://github.com/brianegan/flutter_architecture_samples) which showcases them (but the example is more complex and should be used later on)

The app itself does not a lot - the source code and code structure itself is relevant to understand the different state management solutions. Parts of the app are:

-   setState: here I showcase the base form as a reference
-   Provider: enables some kind of dependency injection (DI) and rebuilds or parts of the widget tree
-   Bloc: works with streams to ensure rebuilds on changed values - has a more strict setup / layout which is good for a good project structure, especially in larger dev teams
-   MobX: hides a lot of boilerplate in its implementation and minimizes the effort for the dev to enable states and rebuilds

Redux, which is not part of this list, is also a very popular solution. It is kinda similar to Bloc but is more popular generally (outside the Flutter scope). Since Bloc has been explicitly developed for Flutter and redux has even more boilerplate I didn't want to include it here. It is still a very good and popular solution especially in bigger projects out there but if you understand Bloc you will understand Redux very fast as well.
