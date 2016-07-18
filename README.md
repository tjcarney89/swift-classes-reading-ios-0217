# Classes

![Drawing](http://i.imgur.com/g5kSxKV.jpg?1)  

> There is no royal road to anything. One thing at a time, all things in succession. That which grows fast, withers as rapidly. That which grows slowly, endures. -[Josiah Gilbert Holland](https://en.wikipedia.org/wiki/Josiah_Gilbert_Holland)
 

## Learning Objectives

* 




## Outline / Notes

*  In prior lessons, we've created multiple variables which represented the planets. But.. these variables were of type `String`. We were only able to store the various String Literal values (i.e. "Earth", "Mars", etc.) in these variables. But what about all of the other attributes that make up a planet? How do we deal with those?

```swift
let name = "Earth"
let numberOfMoons = 1
var percentOxygen = 0.21
var hasLife = true
```
* Not the best answer. What if we wanted to create every single Planet like this? We would have variables floating around everywhere.
* What if we can create a new type (name it whatever we like) and store **ALL** of variables/constants above into **ONE** variable?
* We can create our own types. `Class`

```swift
class Planet {
    //TODO: Write code here
}
```

* We just created a new type. Just like `String`, `Bool`, and `Int` are types, `Planet` is now a type.

* You're an expert now:

![Neil](https://media.giphy.com/media/2XsHRy5G950E47BVuww/giphy.gif)


```swift
class Planet {
    let name: String
    let numberOfMoons: Int
    var percentOxygen: Double
    var hasLife: Bool
}
```
* Here we've created a new type called `Planet` which is a class. Within the curly braces after our declaration here, we've given this `Planet` class some variables and constants.
* This is missing something though? How do we create a planet? How do we assign these various variables some values? When can we do that?

```swift
class Planet {
    let name: String
    let numberOfMoons: Int
    var percentOxygen: Double
    var hasLife: Bool
    
    init(name: String, numberOfMoons: Int, percentOxygen: Double, hasLife: Bool) {
        self.name = name
        self.numberOfMoons = numberOfMoons
        self.percentOxygen = percentOxygen
        self.hasLife = hasLife
    }
}

let earth = Planet(name: "Earth", numberOfMoons: 1, percentOxygen: 0.21, hasLife: true)
```

* There's a lot to now step through with the student here. From my experience teaching this, `self` throws off a lot of students, I'm all ears on a good approach there. Here's something that might work (feel free to run with it or not):

* Lets create a functino outside of the `Planet` class declaration, it's a global function in Playground

```swift
func lostOxygen(self: Planet) {
    
    self.percentOxygen -= 0.02
    
}

lostOxygen(earth)
```

* Here we've named the parameter `self` which is of type `Planet`. So whomever calls on this function, must give us a `Planet`  and we refer to the `Planet` given to us within the scope of this function by our parameter named `self`. 
* Within the scope of every `init` and `func` that you create within your class declaration, you have access to an implicit variable called `self` which refers to the instance of the object who is calling on those functions.

```swift
class Planet {
    let name: String
    let numberOfMoons: Int
    var percentOxygen: Double
    var hasLife: Bool
    
    init(name: String, numberOfMoons: Int, percentOxygen: Double, hasLife: Bool) {
        self.name = name
        self.numberOfMoons = numberOfMoons
        self.percentOxygen = percentOxygen
        self.hasLife = hasLife
    }
    
    func lostOxygen() {
        self.percentOxygen -= 0.02
    }
}

let earth = Planet(name: "Earth", numberOfMoons: 1, percentOxygen: 0.21, hasLife: true)
earth.lostOxygen()
```

* Notice how within the `lostOxygen()` function, we have access to this `self` variable provided to us. Imagine when the `earth` contstant we created above is passing itself along to every function it calls.

* Feel free to not touch TOO much on functions here as that was the intention of the next lesson.

* We should show them accessing these properties. We should teach them the term instance property (maybe?)

```swift
let earth = Planet(name: "Earth", numberOfMoons: 1, percentOxygen: 0.21, hasLife: true)

earth.lostOxygen()

earth.name  // "Earth"
earth.numberOfMoons  // 1
earth.percentOxygen  // 0.19
earth.hasLife  // true
```

* The big IF.... do we talk about classes as reference types here (I'm inclined to say not yet.. save it for the end of this unit... but i'm all ears, because they will bump into it 

<a href='https://learn.co/lessons/Classes' data-visibility='hidden'>View this lesson on Learn.co</a>
