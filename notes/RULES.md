# Flutter Rules

# Naming convention:

Classes, enums, typedefs, and extensions name should in UpperCamelCase.

```
Naming convention:

Classes, enums, typedefs, and extensions name should in UpperCamelCase.
```
Libraries, packages, directories, and source files name should be in snake_case(lowercase_with_underscores).

```
library firebase_dynamic_links;
import 'socket/socket_manager.dart';
```
Variables, constants, parameters, and named parameters should be in lowerCamelCase.

```
var item;
const bookPrice = 3.14;
final urlScheme = RegExp('^([a-z]+):');
void sum(int bookPrice) {
  // ...
}
```
# Use relative imports for files in lib
When use relative and absolute imports together then It is possible to create confusion when the same class gets imported from two different ways. To avoid this case we should use a relative path in the lib/ folder.

```
// Don't
import 'package:demo/src/utils/dialog_utils.dart';


// Do
import '../../../utils/dialog_utils.dart';
```
# Specify types for class member

Always specify the type of member when its value type is known. Avoid using var when possible.
```
//Don't
var item = 10;
final car = Car();
const timeOut = 2000;


//Do
int item = 10;
final Car bar = Car();
String name = 'john';
const int timeOut = 20;
```
# Avoid using as instead, use is operator
sually, The as cast operator throws an exception if the cast is not possible. To avoid an exception being thrown, one can use is.
```
//Don't
(item as Animal).name = 'Lion';


//Do
if (item is Animal)
  item.name = 'Lion';
```
# Use if condition instead of conditional expression
Many times we need to render a widget based on some conditions in Row and Column. If conditional expression return null in any case then we should use if condition only.
```
//Don't
Widget getText(BuildContext context) {
  return Row(
    children: [
      Text("Hello"),
      Platform.isAndroid ? Text("Android") : null,
      Platform.isAndroid ? Text("Android") : SizeBox(),
      Platform.isAndroid ? Text("Android") : Container(),
    ]
  );
}


//Do
Widget getText(BuildContext context) {
  return Row(
      children: 
      [
        Text("Hello"), 
        if (Platform.isAndroid) Text("Android")
      ]
  );
}
```
# Use ?? and ?. operators

Prefer using ?? (if null) and ?. (null aware) operators instead of null checks in conditional expressions.
```
//Don't
v = a == null ? b : a;

//Do
v = a ?? b;


//Don't
v = a == null ? null : a.b;

//Do
v = a?.b;
```
# Use spread collections
When existing items are already stored in another collection, spread collection syntax leads to simpler code.
```
//Don't
var y = [4,5,6];
var x = [1,2];
x.addAll(y);


//Do
var y = [4,5,6];
var x = [1,2,...y];
```
# Use Cascades Operator
If we want to perform a sequence of operations on the same object then we should use the Cascades(..) operator.
```
// Don't
var path = Path();
path.lineTo(0, size.height);
path.lineTo(size.width, size.height);
path.lineTo(size.width, 0);
path.close();  


// Do
var path = Path()
..lineTo(0, size.height)
..lineTo(size.width, size.height)
..lineTo(size.width, 0)
..close(); 
```
# Use raw string
A raw string can be used to avoid escaping only backslashes and dollars.
```
//Don't
var s = 'This is demo string \\ and \$';


//Do
var s = r'This is demo string \ and $';
```
# Don’t explicitly initialize variables null
In Dart, the variable is automatically initialized to null when its value is not specified, so is adding null is redundant and unneeded.
```
//Don't
int _item = null;


//Do
int _item;
```
# Use expression function bodies
For functions that contain just one expression, you can use an expression function. The => (arrow) notation is used for expression function.

```
//Don't
get width {
  return right - left;
}
Widget getProgressBar() {
  return CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
  );
}


//Do
get width => right - left;
Widget getProgressBar() => CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
    );
```
# Avoid print() calls
print()anddebugPrint()both are used for logging in to the console. If you are use print()and output is too much at once, then Android sometimes discards some log lines. To avoid this, use debugPrint(). If you log data has too much data then use dart:developer log(). This allows you to include a bit more granularity and information in the logging output.
# Avoid using leading underscore for local identifiers that aren’t private.
Dart uses a leading underscore(_) in an identifier to mark members and top-level declarations as private. There is no concept of. private using leading underscore(_) for local variables, parameters, local functions, or library prefixes.
# Use interpolation to compose strings
Use interpolation to make string cleaner and shorter rather than long chains of + to build a string.
```
//Don’t
var description = 'Hello, ' + name + '! You are ' + (year - birth).toString() + ' years old.';


// Do
var description = 'Hello, $name! You are ${year - birth} years old.';
```
# Don’t create a lambda when a tear-off will do
If we have a function that invokes a method with the same arguments as are passed to it, you don’t need to manually wrap the call in a lambda.
```
List<String> names=[]
  
// Don’t
names.forEach((name) {
  print(name);
});


// Do
names.forEach(print);
```
# Use async/await overusing futures callback
Asynchronous code is hard to read and debug. The async/await syntax improves readability.
```
// Don’t
Future<int> countActiveUser() {
  return getActiveUser().then((users) {
    
    return users?.length ?? 0;

  }).catchError((e) {
    log.error(e);
    return 0;
  });
}


// Do
Future<int> countActiveUser() async {
  try {
    var users = await getActiveUser();
     
    return users?.length ?? 0;
  
  } catch (e) {
    log.error(e);
    return 0;
  }
}
```
# Split widgets into sub Widgets.
When setState() is called on a State, all descendent widgets will rebuild. Therefore, Split the widget into small widgets so the setState() call to the part of the subtree whose UI actually needs to change.
```
Scaffold(
  appBar: CustomAppBar(title: "Verify Code"), // Sub Widget
  body: Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TimerView( // Sub Widget
            key: _timerKey,
            resendClick: () {})
      ],
    ),
  ),
)
```
# Use ListView.builder for a long list
When working with infinite lists or very large lists, it’s usually advisable to use a ListView builder in order to improve performance.

Default ListView constructor builds the whole list at once. ListView.builder creates a lazy list and when the user is scrolling down the list, Flutter builds widgets on-demand.

# Use Const in Widgets
The widget will not change when setState call we should define it as constant. It will prevent the widget to rebuild so it improves performance.
```
Container(
      padding: const EdgeInsets.only(top: 10),
      color: Colors.black,
      child: const Center(
        child: const Text(
          "No Data found",
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
        ),
      ),
    );
```