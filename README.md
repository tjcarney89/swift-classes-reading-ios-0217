# Classes

![Drawing](http://i.imgur.com/g5kSxKV.jpg?1)  

> There is no royal road to anything. One thing at a time, all things in succession. That which grows fast, withers as rapidly. That which grows slowly, endures. -[Josiah Gilbert Holland](https://en.wikipedia.org/wiki/Josiah_Gilbert_Holland)

## Overview

We'll introduce classes, which provide a way to encapsulate several pieces of data into one object, which you can refer to using one constant or variable.

## Learning Objectives

* Create data types using classes
* Distinguish between classes and instances of a class
* Declare properties for a class
* Turn functions into methods for a class
* Use `self` in a method

## Classes

So far in your Swift studies, you have encountered a few different data types: `String`s, `Int`s, `Array`s, `Dictionaries`, and so on. These types have been fairly basic: `String`s hold a sequence of characters, `Int`s hold a number, and so forth.

Imagine you're writing an app to track data for the planets in our solar system. You'd like to keep various points of data for each of these planets: its name, number of moons, orbital period, and whether it has life or not. You could track this information easily enough in a set of constants:

```swift
let earthName = "Earth"
let earthMoons = 1
let earthOrbit = 365.26
let earthLife = true

let marsName = "Mars"
let marsMoons = 2
let marsOrbit = 686.97
let marsLife = false
```

You can probably see that this is already a bit unwieldy, but say you wanted to write a function that takes in some information about a planet, and prints a message detailing that planet's information. Such a function might look like this:

```swift
func planetInfo(name: String, moons: Int, orbit: Double, hasLife: Bool) {
    var moonNoun = "moon"
    if moons != 1 {
        moonNoun = "moons"
    }
    var hasLifeString = "has life"
    if !hasLife {
        hasLifeString = "does not have life"
    }
    print("\(name) has \(moons) \(moonNoun). Its orbit is \(orbit) days. It \(hasLifeString).")
}

planetInfo(name: earthName, moons: earthMoons, orbit: earthOrbit, hasLife: earthLife)
planetInfo(name: marsName, moons: marsMoons, orbit: marsOrbit, hasLife: marsLife)
```

That's _really_ unwieldy! `planetInfo` takes _four_ parameters, and you have to remember to pass them in the right order. Wouldn't it be a lot easier if you could store all of that information together, in one constant (or variable)?

You've learned about tuples. Maybe this information would be a lot easier to track in a tuple. You could rewrite your code to look more like this:

```swift
let earth = ("Earth", 1, 365.26, true)
let mars = ("Mars", 2, 686.97, false)

func planetInfoTuple(planet: (String, Int, Double, Bool)) {
    var moonNoun = "moon"
    if planet.1 != 1 {
        moonNoun = "moons"
    }
    var hasLifeString = "has life"
    if !planet.3 {
        hasLifeString = "does not have life"
    }
    print("\(planet.0) has \(planet.1) \(moonNoun). Its orbit is \(planet.2) days. It \(hasLifeString).")
}

planetInfoTuple(planet: earth)
planetInfoTuple(planet: mars)
```

This is a bit better: When you call `planetInfoTuple`, you only need to pass one parameter, and all of a planet's data is stored together. But it's still unwieldy: `planetInfoTuple` has to know exactly which numbered fields contain which pieces of data. There must be a better way!

There is: _Classes_.

Classes provide a way to _encapsulate_ several pieces of data into one _object_, which you can refer to using one constant or variable. Classes can also implement _behavior_ in the form of _methods_ which allow you to interact with _instances_ of the class.

Classes are also a way for you to create your own _type_. A class is a distinct type, just like `String`s, `Int`s, and `Array`s are types. Classes integrate with Swift's type checker in exactly the same way as built-in data types.

### Defining Classes

You can define a class using the `class` keyword, followed by the name of the class, and a set of curly braces:

```swift
class Planet {
}
```

Easy, right? So far, though, your new `Planet` class doesn't really do anything special. Sure, you have a new type, but you haven't solved your real problem yet: Storing data points for a planet.

That's where _properties_ come in. Classes can have _properties_ which are pieces of data about specific instances of a class. They are declared similarly to how you declare constants or variables anywhere else, except you don't have to assign a value to them immediately (you'll see why in a second). Here's how you add properties for a planet's name, orbital period, number of moons, and whether it has life or not:

```swift
class Planet {
    var name: String
    var numberOfMoons: Int
    var orbitalPeriod: Double
    var hasLife: Bool
}
```

One thing to note: When declaring properties, you have to specify the _type_ of the property. Do you know why? Since you didn't assign a value, Swift can't _infer_ the type—so you have to be explicit about it.

Let's create some planets!

Or…wait. If you entered that code into your own playground (and you should!), you probably notice that the Swift compiler has given you an error: "Class 'Planet' has no initializers". What does that mean? What the heck is an "initializer"?

An _initializer_ is the method called when you create an instance of a class. It sets up the class's state, including the values of its properties. This special method is called `init`. Often times, a class's initializer accepts a parameter for each property, and assigns that parameter to the property. An initializer for the `Planet` class could look like this:

```swift
init(name: String, numberOfMoons: Int, orbitalPeriod: Double, hasLife: Bool) {
    self.name = name
    self.numberOfMoons = numberOfMoons
    self.orbitalPeriod = orbitalPeriod
    self.hasLife = hasLife
}
```

Notice that the initializer is simply called `init`. It is not proceeded by a keyword such as `func`. While `init` is a method, it is a _special_ method, and has a special syntax. It also returns no value.

Notice, too, that the properties are prefixed by the keyword `self`. In a method, `self` returns to the current instance of a class. In this `init` method, `self` is used to distinguish between the properties and the parameters to `init`, since both the parameters and properties have the same name. (Don't worry about `self` for now: We'll cover that in more detail shortly.)

After you've created an initializer, the complete definition of `Planet` looks like this:

```swift
class Planet {
    var name: String
    var numberOfMoons: Int
    var orbitalPeriod: Double
    var hasLife: Bool

    init(name: String, numberOfMoons: Int, orbitalPeriod: Double, hasLife: Bool) {
        self.name = name
        self.numberOfMoons = numberOfMoons
        self.orbitalPeriod = orbitalPeriod
        self.hasLife = hasLife
    }
}
```

How do you create new planets, though?

### Creating `Planet`s

A `Planet` is a class. Particular `Planet` constants and variables are known as _instances_ of a class, and when you create one, you are said to be _instantiating_ a class. Particular instances of a class are also commonly referred to as _objects_. You can think of a class definition, such as the one for `Planet`, as a blueprint. It defines how a particular "thing" is defined. An _instance_ of a class, or _object_, is one actual "thing" made from that blueprint.

Instantiating a new planet is pretty easy:

```swift
let earth2 = Planet(name: "Earth", numberOfMoons: 1, orbitalPeriod: 365.26, hasLife: true)
let mars2 = Planet(name: "Mars", numberOfMoons: 2, orbitalPeriod: 685.97, hasLife: false)
```

The code above creates two new `Planet` instances: `earth2` and `mars2`. You can create an instance by calling the class similarly to how you call a function. The parameters you pass in are the same as the ones you specified in the class's `init` method. (When you call `Planet(name:numberOfMoons:orbitalPeriod:hasLife:)`, you're essentially calling the class's `init` method.)

Now that you have a `Planet` class and can create instances of it, how would you rewrite the `planetInfo` function so you can print out information about particular instances of the `Planet` class?

### Methods

You could rewrite the tuple version of `planetInfo` pretty easily to take in a `Planet` parameter instead, and print the information encapsulated by that `Planet` instance:

```swift
func planetInfoObject(planet: Planet) {
    var moonNoun = "moon"
    if planet.numberOfMoons != 1 {
        moonNoun = "moons"
    }
    var hasLifeString = "has life"
    if !planet.hasLife {
        hasLifeString = "does not have life"
    }
    print("\(planet.name) has \(planet.numberOfMoons) \(moonNoun). Its orbit is \(planet.orbitalPeriod) days. It \(hasLifeString).")
}

planetInfoObject(planet: earth2)
planetInfoObject(planet: mars2)
```

Keep in mind, though, that `planetInfoObject` is defined globally, meaning it is available everywhere in your Swift program, and more important, that the name cannot be used by any other function. This isn't a problem for `Planet` necessarily, but what if you start accumulating more classes, each with its own set of functions. At some point, it would be nice to have more organization in your functions, wouldn't it?

Luckily, Swift provides a way to do that with methods. A _method_ is a function that is tied to a particular class. You can call that method on instances of that class. Methods are declared just like functions, but within the scope (curly braces) of a class definition.

Most importantly, a method automatically has access to the _instance_ that it was called on. That instance is referred to as `self` within that method body. You could move `planetInfoObject` to your `Planet` class definition like so:

```swift
class Planet {
    var name: String
    var numberOfMoons: Int
    var orbitalPeriod: Double
    var hasLife: Bool

    init(name: String, numberOfMoons: Int, orbitalPeriod: Double, hasLife: Bool) {
        self.name = name
        self.numberOfMoons = numberOfMoons
        self.orbitalPeriod = orbitalPeriod
        self.hasLife = hasLife
    }

    func planetInfo() {
        var moonNoun = "moon"
        if self.numberOfMoons != 1 {
            moonNoun = "moons"
        }
        var hasLifeString = "has life"
        if !self.hasLife {
            hasLifeString = "does not have life"
        }
        print("\(self.name) has \(self.numberOfMoons) \(moonNoun). Its orbit is \(self.orbitalPeriod) days. It \(hasLifeString).")
    }
}
```

You can call `planetInfo` by writing the name of a `Planet` variable or constant, followed by a dot (`.`), and then `planetInfo`:

```swift
earth2.planetInfo()
mars2.planetInfo()
```

Notice that you don't have to pass a parameter: `planetInfo()` will already have access to the instance it is called on, via `self`.

#### What's Up With `self`?

`self` is a bit weird, so it might make sense to break this down a bit more. Let's review what you've learned so far about methods from the beginning.

At first, you wrote `planetInfo` as a simple function that took a `Planet` parameter:

```swift
func planetInfo(planet: Planet) {
    var moonNoun = "moon"
    if planet.numberOfMoons != 1 {
        moonNoun = "moons"
    }
    var hasLifeString = "has life"
    if !planet.hasLife {
        hasLifeString = "does not have life"
    }
    print("\(planet.name) has \(planet.numberOfMoons) \(moonNoun). Its orbit is \(planet.orbitalPeriod) days. It \(hasLifeString).")
}
```

Remember that you could have named that `planet` parameter anything you wanted. Let's say you named it `self` instead:

```swift
func planetInfoObject(self: Planet) {
    var moonNoun = "moon"
    if self.numberOfMoons != 1 {
        moonNoun = "moons"
    }
    var hasLifeString = "has life"
    if !self.hasLife {
        hasLifeString = "does not have life"
    }
    print("\(self.name) has \(self.numberOfMoons) \(moonNoun). Its orbit is \(self.orbitalPeriod) days. It \(hasLifeString).")
}
```

No problem, right? Swift doesn't care what exactly you call a parameter, as long as you always refer to that parameter using the right name. `self` is just as fine as `planet`.

Remember that you call that function like this:

```swift
let earth = Planet(name: "Earth", numberOfMoons: 1, orbitalPeriod: 365.26, hasLife: true)

planetInfo(planet: earth)
```

Inside the `planetInfo` function, `self` refers to that `earth` instance—it's just called `self` inside the function, because that's the name of the parameter.

When you moved `planetInfo` inside of the class method and removed the parameter, you were still able to refer to `self`:

```swift
class Planet {
    var name: String
    var numberOfMoons: Int
    var orbitalPeriod: Double
    var hasLife: Bool

    init(name: String, numberOfMoons: Int, orbitalPeriod: Double, hasLife: Bool) {
        self.name = name
        self.numberOfMoons = numberOfMoons
        self.orbitalPeriod = orbitalPeriod
        self.hasLife = hasLife
    }

    func planetInfo() {
        var moonNoun = "moon"
        if self.numberOfMoons != 1 {
            moonNoun = "moons"
        }
        var hasLifeString = "has life"
        if !self.hasLife {
            hasLifeString = "does not have life"
        }
        print("\(self.name) has \(self.numberOfMoons) \(moonNoun). Its orbit is \(self.orbitalPeriod) days. It \(hasLifeString).")
    }
}
```

Why is that the case?

Inside the `planetInfo` _method_, `self` refers to the object that the method was called on. When you called the method, you wrote this:

```swift
earth.planetInfo()
```

Essentially, that method call is like this:

```swift
planetInfo(earth)
```

Except that first parameter is _implicit_—the `earth` object is automatically passed to the method, and you can refer to it as `self` inside the method.


<a href='https://learn.co/lessons/Classes' data-visibility='hidden'>View this lesson on Learn.co</a>

<p class='util--hide'>View <a href='https://learn.co/lessons/swift-classes-reading'>Classes</a> on Learn.co and start learning to code for free.</p>
