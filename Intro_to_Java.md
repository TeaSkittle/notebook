# Intro to Java
Notes from my intro to porgramming course ( https://github.com/TeaSkittle/CSCI_1105_IntroToProgramming_Coursework ).

## Chapter 1

### Hardware Stuff
* CPU: consists of Arithmetic/Logic Unit(ALU) & Logical operations.
* 0 or 1 = bit
* 8 bits = 1 byte

### Language Concepts
* Interpeter: reads one statement from code, translates it to machine code and executes it right away
* Compiler: translate entire source code to machine code, then executes it
* Multiprogramming: allows multiple programs to run simultaneously on the same cpu
* Multithreading: allows a single program to executre mulitple tasks simultaneously
* Multiprocessing: uses two or more proccessors together to perform subtasks concurrently and combine solution. (aka parallel processing)

### Java Specifics
* API = Application Program Interface, aka library
* All java programs must have atleast 1 class, (1st letter uppercase for convention)
* Comments are same as C
* compile as: 
```bash
$ javac ClassName.java
```
* run as: 
```bash
$ java ClassName
```
* Source file(.java) must have the same exact name as the public class name

## Chapter 2

### Variables
* Use _double_ for floating point numbers
* Can use + for addition and concatenate strings, ex:
```java
System.out.println( "hello" + "world" );
```
* Remember that Java is case sensitive, so carefully name vriables.
* To declare a constant variable, use the __final__ keyword, ex:
```java
final double PI = 3.14; // Declares a constant variable named pi
```
  * A constant variable doesn't change, hence the keyword constant/final

### Importing/Including
* Can import packages two ways, either specific or using a wildard:
```java
  import java.util.Scanner;
  import java.util.*;
 ```
* There is no performance difference between the two

### Input & Output
* Java uses System.out to refer to stdout and System.in for stdin
* To get input from user, must create a scanner object, ex:
```java
import java.util.Scanner; // Scanner is in the java.util package

class ScannerExample{
      public static void main( String[] args ){
      	     // Create scanner object named input
      	     Scanner input = new Scanner( System.in );
	     // Create a simple prompt
	     System.out.print( "Enter a number: " );
	     // Tell input object to get double from stdin
      	     double userNumber = input.nextDouble();
	     // Print userNumber to stdout
	     System.out.println( "You entered " + userNumber );
      }
}
```
* Can use nextDouble(), nextInt(), etc... to get a value from the user

### Naming Conventions
* Variables and methods should be lowercase, if name is multiple words use Camel Case:
```java 
int a, brick, brickHouse;
```
* Classes should start with uppercase, and than use Pascal Case
```java
public class BrickHouse {
```
* Capatalize every letter in a constant and spereate with underscores, like #define in C
```java
final int BRICKS_NEEDED = 200;
```

### Math Operations
* Unary operators have only one operator, a binary operator has two
* Has the same operators as C: 
```java
+  -  *  /  %
```
* Extra math functions need to be included:
```java
import java.util.Math;
```
* Exponents are done with: Math.pow(a, b), ex:
```java
System.out.println( Math.pow( 2, 3 )); //Prints out 8.0
```
* A __literal__ is a _constant value_ that appears directly in a program
* For better readability, Java allows underscores between two digits in a literal number
```java
long ssn = 232_45_4519;
```
* Has C-style assignment operators: 
```java
+=  -=  *=  /=  %=
```
* Has C-style increment & decrement operators:
```java
a++ a--
++a --a
```
* Type casting means to convert to another data type, ex:
```java
double tax = 0.06;
System.out.println( "Sales tax is $" + ( int )( tax * 100 ) / 100.0 );
```

### Misc
* To get current time from the UNIX Epoch
```java
System.currentTimeMillis();
```
* Would have to do more math to print out GMT time

## Chapter 3

### Control Flow
* Java has boolean data types: _true, false_
  * Can't use 1 or 0 for boolean, must use above keywords 
* Can use _if_, _else_, and _else if_ for flow control
* Java supports these logical operators: __!, ||, &&, ^__
```java
// Example using XOR symbol: ^
if ( number % 2 == 0 ^ number % 3 == 0 ) {
   System.out.println( number + " is divisible by 2 or 3, but not both." );
}
```
* Java has switch statements, which are identical to C:
```java
switch ( status ) {
  case 0: x = 2; break;
  case 1: x = 4; break;
  default: break;
}
```
	
### Random Number Generation
* Math.random() will create a random double between 0.0 and 1.0 (excluding 1.0)
* To generate a random single didgit integer:
```java
int number = ( int )( Math.random() * 10 );
```
* To generate random values within a given range:
```java
double x = ( Math.random() * (( max - min ) + 1 )) + min;
```

## Chapter 4

### Useful Math Functions
* toDegree( radians ) - Returns the angle in degress for the angle in radians
* sin( radians ) - Returns the trigonometric sine of an angle in radians
  * Also can do cos( radians ) and tan( radians )
* exp( x ) - Returns e raised to power of x ( e^x )
* log( x ) - Returns the natural logarithm of x
* pow( a, b ) - Returns a raised to the power of b ( a^b )
* sqrt( x ) - Returns the square root of x
* ceil( x ) - x is rounded up to the nearest integer
* floor( x ) - x is rounded down to the nearest integer
* abs( x ) - Return the absolute value of the number

### Random Numbers
* ( int )(Math.random() * 10 )- Returns a random integer between 0 and 9
* In general, this code will return a number between a and ( a + b ), excluding a + b:
```java
a + Math.random() * b
```

### Char Data Type
* char data type represents a single character
```java
char letter = 'A';
char numChar = '4';

/* The first statement assigns A the char variable letter, the second
statement assigns digit character 4 to the char variable numChar */
```
* A string literal must be enclosed in quotations marks( " " )
* A character literal must be enclosed in single quotes( ' ' )
  * Therefore "A" is a string and 'A' is a character
* To use unicode character in your code, preceed hex code with \u
```java
char letter = '\u03b1' // the Greek letter alpha
```
* Any positive integer between 0 and FFFF in hex can be cast into a char implicitly
* All numeric operators can be applied to char operands:
```java
int i = '2' + '3';                 // ( int )'2' is 50 and ( int )'3' is 51
System.out.println( "i is " + i ); // i is 101
int j = 2 + 'a';                   // ( int )'a' is 97
System.out.println( "j is " + j ); // j is 99
System.out.println( j + " is the Unicode for character " 
  + ( char ) j );                  // 99 is the Unicode for character c
/*
This would display:

i is 101
j is 99
99 is the Unicode for character c
*/
```

### String Data Type
* To represent a string of character, use the _String_ data type
```java
String message = "Hello World!";
```
* Simple methods for _String_ objects:
  * length() - Returns the number of characters in this string
  * charAt( index ) - Returns the characters at the specified index from this string
  * concat (s1 ) - Returns a new string the concatenates this string with string s1
  * toUpperCase() - Returns a new string with all uppercase letters
  * toLowerCase() - Returns a new string with all lowercase letters
  * trim() - Returns a new string with withspace characters trimmed from both sides
* To read a sring from the console, invoke the next() methos on a Scanner object:
```java
Scanner input = new Scanner( System.in );
System.out.print( "Enter a tring: " );
String s1 = input.next();
```
* Comparison methods for _String_ methods:
  * equal( s1 ) - Returns true if this string is equal to string s1
  * equalsIgnoreCase( s1 ) - Returns true if string is equal to s1, is case insensitive
  * compareTo( s1 ) - Returns an integer greater than 0, equal to 0, or less than 0 to indicate whether this string is greater than, equal to, or less than s1.
  * compareToIgnoreCase( s1 ) - Same as comapreTo except it's case insensitive
  * startsWith( prefix ) - Returns true is this string starts with specified prefix
  * endsWith( suffix ) - Returs true if this string ends with specified suffix
  * contains( s1 ) - Returns true if s1 is a substring in this string
* To add on to a string, use substrings:
```java
String message = "Welcome to Java";
String message = message.substring( 0, 11 ) + "HTML";  // Will print out: "Welcome to HTML"
```
* Remember that strings are just arrays of characters, and can be treated as such:
```java
String s = "Kim Jones";
int k = s.indexOf( ' ' );  // The blank space char in the string
String firstName = s.substring (0, k );  // substring(beginIndex, endIndex)
String lastName = s.substring (k + 1 );  // k + 1 is 'J' in s
```
### Formatted output
* To use fomratted out print, use _printf_:
```java
System.out.printf();
```
* This allows for C-style printing using delimeters, such as:
```java
int a = 4;
System.out.printf( "A = %d", a );
```

### Misc
* You do not have to import Math functions, they are in stdio of language
* Useful escape sequences:
  * \b - Backspace
  * \t - Tab
  * \n - New Line
  * \r - Carriage Return
  * \\\\ - Backslash
  * \\" - Double Quote

## Chapter 5

### Loops
* Loops have C-like structure
* __While__
```java
while ( loop-continuation-condition ) {
  // Loop body
  ...
}
```
* __Do while__
```java
do {
  // Loop body;
  ...
} while ( loop-continuation-condition );
```
* __For__
```java
for ( i = initialValue; i < endValue; i++ )
  // Loop body
  ... 
}
```
* All three loops are expressively equivalent, you can write the same loop in each style ( except in very rare circumstances )
* The keyword _break_ immediatley terminates the loop
* The keyword _continue_ ends the current iteration and goes the the end of the loop

## Chapter 6

### Methods
* Think of methods as a funciton in C, except are objects:
```java
// Add a plus b
public static int sum( int a, int b ) {
    int result = 0;
    result = a + b;
    return result;
}

public static void main( String[] args ) {
    System.out.println( "Sum of 1 plus 10 is " + sum( 1, 10 ));
}
```
* Syntax for defining a method:
```java
modifier returnValueType methodName( list of parameters ) {
  // Method body;
}
```
* Parameters are optional, for example _Math.random()_ has no parameters
* To invoke a method from another class: `ClassName.methodName`
* A void() method does not return a value
* You can use _return;_ to terminate a void() method early, example:
```java
public static void printGrade( double score ) {
  if ( score < 0 || score > 100 ) {
    System.out.println( "Invalid score" );
    return;  // This acts like a break statement in a loop
  } 
  if ( score >= 90 ) {
    System.out.println( 'A' );
  }
  // etc...
}
```
* __Method Overloading__: two methods have the same name but different parameter lists within one class

### The Stack
* Also refered to as: _execution stack, runtime stack, call stack, or machine stack_
* Each time a method is invoked, the system creates an activation record and stores it in a stack. (Pushed onto the stack)
* When a method finishes its work, it is removed from the stack (popped from the stack)

### Misc
* _Local Variable_: A variable defined inside of a method, and only use withing the method
* _Method abstraction_ is achieved by seperating the use of a method from its implementation

## Chapter 7

### Array Basics
* To declare an array, use this syntax (preffered):
```java
// elementType[] arrayRefVar;
double[] myList;
```
* You can also declare arrays using C-like syntax (not preffered):
```java
// elementType arrayRefVar[]
double myList[];
```
* Declaring an array variable, creating an array, and assigning the reference of the array to the variable can be combined in one statement as:
```java
double[] myList = new double[ 10 ];  // double[ 0 to 9 ]
```
* Arrays range from 0 to array.length-1
* Two different ways of assigns value to index of array:
```java
// Method one:
double[] myList = new double[ 3 ];
myList[ 0 ] = 0;
myList[ 1 ] = 1;
myList[ 2 ] = 2;

//Method Two
double[] myList = { 0, 1, 2 };
```
* This will cause a syntax error:
```java
double[] myList;
myList = { 0, 1, 2 };
```
* You can pass an array to a method: _public static void array( int[] a )_
* A method can also return an array: _return array;_
* Can declare a method with variable array size: _public int array( int... a )_
* java.Utils.Arrays contains several useful methods to manipulate and handle arrays

### Arrays & Loops
* Since arrays contain the same data type, for loops are perfect for proccessing their data, example:
```java
double[] myList = new double[ 10 ];
for ( int i = 0; i < myList.length; i++ ) {
    System.out.print( myList[ i ] + " ");
}
```
* Java also supports a foreach loop style syntax for manipulaitng arrays, exmaple:
```java
for ( double e: myList ) {
    System.out.println( e );
}
```

### Copying Arrays
* To copy an array you can either use System.arraycopy
```java
int a[] = { 1, 2, 3, 4 };
int b[] = new int[ a.length ];
// arraycopy(sourceArray, srcPos, targetArray, tarPos, length);
System.arraycopy( a, 0, b, 0, a.length );
for ( int i = 0; i < b.length; i++ ) {
    System.out.print( b[i] + " " );
}
```

### Command-Line Arguments
* The main method takes string arguments _public statc void main(String[] args)_
* Arguments are referenced with: args[0], args[1], args[2] (just like an array)

## Chapter 8

### Two-Dimensional Arrays
* Syntax for declaring a two-dimensional array is:
```java
/ /elementType[][] arrayRefVar;
int[][] matrix;
matrix = new int[ 5 ][ 5 ]; // Creates a 5x5 array (think of as a table or matrix)
matrix[ 2 ][ 1 ] = 7;       // Assigns the value 7 at location 2, 1
```
* Each row in a two-dimensional array can have different lengths, for example:
```java
int[][] triangleArray = {
  { 1, 2, 3, 4, 5 },
  { 2, 3, 4, 5 },
  { 3, 4, 5 },
  { 4, 5 },
  { 5 }
};
// triangleArray[ 0 ].length = 5, triangleArray[ 4 ].length = 1
```
* To print a two-dimensional array using nested loops:
```java
for ( int row = 0; row < matrix.length; row++ ) {
  for ( int column = 0; column < matrix[row].length; column++ ) {
    System.out.print( matrix[ row ][ column ] + " " );
  }
}
```

### Multidimensional Arrays
* MD arrays are essentialy nested arrays(arrays consisting of arrays)
* A MD array is actually an array in which each element is an array.
