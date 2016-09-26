let earthName = "Earth"
let earthMoons = 1
let earthOrbit = 365.26
let earthLife = true

let marsName = "Mars"
let marsMoons = 2
let marsOrbit = 686.97
let marsLife = false

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

let earth2 = Planet(name: "Earth", numberOfMoons: 1, orbitalPeriod: 365.26, hasLife: true)
let mars2 = Planet(name: "Mars", numberOfMoons: 2, orbitalPeriod: 685.97, hasLife: false)

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

earth2.planetInfo()
mars2.planetInfo()
