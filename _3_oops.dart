class Vehicle {
  int speed = 10;
  bool hasEngine = true;

  void accelerate() {
    speed += 10;
  }
}

//Inheritance
//NOTE: multiple inheritance is not allowed in dart same as in java
class Car extends Vehicle {
  int noOfWheels = 4;
  void printWheels() {
    print(noOfWheels);
  }

  //even though the return type of this method is different, accelerate() method call on the instance of Car is going to be this method (as the method name is same)
  @override
  int accelerate() {
    speed += 22;
    return speed;
  }
}

class Truck extends Vehicle {
  int noOfWheels = 8;
  void printWheels() {
    print(noOfWheels);
  }
}

class Bike extends Vehicle {
  int noOfWheels = 2;
  @override
  int speed = 40;
}

class GearUp {
  void accelerate() {
    print("accelerating");
  }
}

//implements (similar to abstract class, the difference is that a class needs to the method body defined (as a usual class) but asbstract class can have only the definition of the methods)
//NOTE: normal classes are actaully an implicity abstract classes
class SuperBike extends Bike implements GearUp {
  @override
  int accelerate() {
    return speed += 49;
  }
}

//abstract class and mixins
abstract class VehicleType2 with JetPackInfo, FuelPackInfo {
  int topSpeed = 25000;
  void accelerate();
}

//if we either extend of implements from an Abstract class, it is required to override all the methods/implement all the methods of the abstract class
class Jet extends VehicleType2 {
  //NOTICE: we can implement/extends our abstract class
  @override
  void accelerate() {
    print('acclerating my jet with a speed of $topSpeed km/h');
  }
}

//mixins
//FOR Later: there's also a syntax for restricting access, check it later
mixin JetPackInfo {
  bool isSpaceReachable = true;
}

mixin FuelPackInfo {
  int fuelQuantity = 500000;
}

//sealed class - the switch statement would now need all the classes in its cases that implements this class
//sealed classes are implicitly abstract by default(eg. it cannot be instantiated) and the no other class can implement it outside its own file/library/package
sealed class SealedClass {}

class A implements SealedClass {}

class B extends SealedClass {}

class C implements SealedClass {}

class E
    implements
        C {} //NOTICE: this is not a direct subtype of SealedClass, hence exhaustive search would ignore this class in the switch statement

//final class - same as sealed class, but it can be constructed/instantiated (not implicitly abstract by default) and also it doesn't force the exhaustive search in the switch statements
//any class extending/implementing final class must be final,sealed or base class
final class FinalClassExample {}

//base class- can only be extended, cannot be implemented, other classes can extend it outside its own package
//any class extending base class must be final,sealed or base class
base class BaseClassExample {}

//interface class- can only be implemented, cannot be extended
//interface class can be instantiated(Not a true interface class like java)
interface class InterfaceClassExample {}

//to make interface class not be instantiated, combine it with an abstract class
abstract interface class TrueInterfaceClassExample {}

//mixin class
mixin class MixinDetailsClass {}

class U with MixinDetailsClass {}

void main() {
  Vehicle car = Car();
  car.accelerate();
  print(car.speed);
  print((car as Car).noOfWheels); //casting to type class Car

  SuperBike myHonda = SuperBike();
  print(myHonda.accelerate());
  print(myHonda.hasEngine);

  VehicleType2 myPrivateJet = Jet();
  myPrivateJet.accelerate();
  print(myPrivateJet.isSpaceReachable ? "can go to space" : "meant for earth");
  print(myPrivateJet.fuelQuantity);

  SealedClass a = A();
  //the swith statements with sealed classes will exhaustively search for all the classes that was implented/extended from the sealed class (this is possible because the SealedClass will only check for 'direct subtypes' within its own file/library)
  switch (a) {
    //since, its an exhaustive search, all the cases needs to be considered
    case A():
      print(a.runtimeType);
    case B():
      print(a.runtimeType);
    case C():
      print(a.runtimeType);
    //case E() is not reqd. as it it not a direct subtype
  }

  dynamic name = 'Aadarsh Kumar Shah';
  print((name as String).split(" "));
}
