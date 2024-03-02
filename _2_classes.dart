class Cookie {
  String shape;
  double size;

  //static variables (cannot be called from an instance, doesn't require the whole instance of an object to be created first to call these static variables, hence it saves memory and time)
  static String good = "good cookie";
  static String bad = "bad cookie";

  //private variable
  bool _isSalty = false;

  Cookie(this.shape, this.size) {
    print("cookie ctor called");
    baking();
  }

  //methods
  void baking() {
    print("cookie is baking");
  }

  //static method
  static void tasty() {
    print("tasty");
  }

  //getters and setters
  bool get isSalty => _isSalty;
  set isSalty(bool s) {
    _isSalty = s;
  }
}

//since SealedClass is a class outside this file/library, hence no other class can implement/extend it here
// class D implements SealedClass {} //not possible

void main() {
  Cookie cookie = Cookie('Circle', 45); //or final cookie =  Cookie();
  // cookie.baking();
  print('${cookie.shape} of ${cookie.size} mm');
  // print(Cookie().size); //new instance
  // Cookie().baking(); //new instance

  cookie._isSalty = true;
  cookie.isSalty = false; //setter (NOTE: no () are being used)
  print(cookie._isSalty);
  print(cookie.isSalty); //calling the getter
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  print(listOfStrings);

  //static variables (called directly through classname)
  print(Cookie.good);
  print(Cookie.bad);
  Cookie.tasty();
}
