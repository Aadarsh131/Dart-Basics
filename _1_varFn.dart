String? outsideVar;
void main() {
  // test('calculate', () {
  //   expect(calculate(), 42);
  // });
  String a = 'aaa,bbb';
  a = "aadarsh,${a.isEmpty},priya";
  print(a.split(","));

  a = '\$12';
  print(a);

  a = '''Hello, 
       World''';
  print(a);

  //dynamic
  dynamic b =
      "echo"; //compiler doesn't know the type, it will only be known at runtime
  print(b.runtimeType);
  b = 10; //types can be changed with dynamic datatype
  print(b.runtimeType);

  //var/final/const (different from dynamic); var is mutable but final/const are immutable
  var c =
      'aadarsh'; //compiler knows it is a string before runtime (or during compile time) unlike dynamic
  // c = 10; //not allowed, since compiler has already set the a type(of string) to this variable, hence, it cannot be changed now

  //difference between final and const
  //NOTE: DateTime.now() will only be executed at runtime
  final DateTime someValue2 = DateTime.now();
  // const someValue3 = DateTime.now(); //const requires a compile time value, hence an error
  const String someValue3 = 'aada';

  //Optional variable
  String? d = null; //can be string or null
  int? e = null; //can be int or null
  // print(d.length); //COMPILE TIME ERROR cannot execute a method on null type (example of null safety in dart)
  // print(d!.length); //RUNTIME ERROR, `!` tells dart compiler that it is not a null (it is example of logical error)
  print(d
      ?.length); //OUTPUT: null; it will never be an error, as `?` tells only to execute the method if its not null, otherwise it will just return the value before it

  final f =
      null; // f becomes of type dynamic, hence avoid assigning null to final/var/const

  //global variables (in our case outside the void main()), its context is unknown by the compiler, hence compiler dont know whether the variable (outsideVar in our case) is of what type
  // print(outsideVar.length); //COMPILE ERROR; outsideVar's type is unknown by compiler as the variable is defined outside the function, hence we need to explicitly use ? or ! with it
  outsideVar = null;
  print(outsideVar?.length);
  print(outsideVar?.length ??
      0); //??0 at the end tells the compiler to print 0 insted of null if variable outsideVar is null
  // print(outsideVar!.length ??0); //RUNTIME ERROR( Null check operator used on a null value) as we are specifying the left operand(!) is not null and on the other hand telling print 0 if its null (using ??), which is contradicting

  //Switch statements (we dont need a break statement after every case, we only need break if the case is empty)
  switch (outsideVar) {
    case null:
    case 'aaa' when b == 10: //checking 2 condition in one case
    case 'bbb':
      print(
          'bbb'); //this code is executed because we dont have 'break' in empty cases above
    default:
      print('from defa');
  }

  //functions
  var values = printSomething();
  print(values.$2);
  var (nVal, stringValue, boolValue) =
      printSomething(); //known as pattern (similar to destructuring in javascript)
  print(nVal);
  print(boolValue);

  print(printName('aadarsh'));

  (bool, {int? age, bool isGraduated, String name}) details =
      printDetails(true, name: 'aadarsh', isGraduated: true);
  print(details);

  final stuff = printStuff();
  print(stuff());
  print(() {
    print('xyz');
  }());
  print(() {
    return 43;
  });
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////
(int, String, bool) printSomething() {
  //returing multliple values as `records` (similar to tuple in python)
  return (1, 'something', true);
}

//compiler assumes the return and the parameter type as dynamic (avoid these as all cost)
printName(name) {
  return name;
}

//example of positional and named args together
(bool, {String name, int? age, bool isGraduated}) printDetails(bool isFit,
    {required String name, int? age, required bool isGraduated}) {
  //NOTE: positional args cannot be after the named args
  // print('$name $age ${isGraduated ? 'yes' : 'no'}');
  return (isFit, name: name, age: age, isGraduated: isGraduated);
}

//function returing function
Function printStuff() {
  return () {
    print('stuff');
  };
}
