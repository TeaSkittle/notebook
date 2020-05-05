# Java OOP Basics

Notes from my OOP course ( https://github.com/TeaSkittle/CSCI_1110_OOP_Coursework )

Quote from textbook:
> The three pillars of object-oriented programming are encapsulation, inheritance, and polymorphism.

# Encapsulation
The details of implementation are _encapsulated_ and hidden from the user. For example, you can create a Circle object and find the area of the circle without knowing how the area is computed. You can define how ecapsulated something is using different keywords for their visibility. From most to least visible:  
1. public = can be accessed from the same class, same package, a subclass in a different package, and a different package.
2. protected = can be accessed from the same class, same package, and a subclass in a different package.
3. default(no modifier) = can be accessed from the same class, and the same package.
4. private = can only be accessed from the same class.

### Final
A final class cannot be a parent class, a final method cannot be overridden by a subclass. Good examples of these are the: Math, String, and StringBuilder classes. These are constant and there is no real reason to alter them with another class or method. 

### Static
* static is different than the above keywords, it means that it belongs to the class instead of a specific instance. By default all methods are non-static unless the static keyword is used.
* static methods and variables are more memory effecient (minor optimization but worth noting).
* static variables are sort of like global vraibles in other languages
* When calling a static method, must use the class name, not the method name. Example:
```java
class MyClass{
	// static method
	public static A() {}	
	
	// static varaible
	public static String message = "Hello!";
}

// Calling static methods & variables
MyClass.A();
System.out.println( MyClass.message );
```

## Inheritance
* Basically use a superclass as a parent to other classes as a basis to expand on. The child class can use maethods from the parent class, this reduces the need to rewrite as much code.
* Any class can be a "super-class', just call the child class with the keyword: __extend__. Example:  
```java
class A {
	// Class A code goes here
}

class B extends A {
	// class B code goes here
	// and can use code from class A
}
```
* Use the __super__ keyword to access data from parent classs, example:
```java
class A {
	String color = 'white";
}

class B extends A {
	String color = "black";
	System.out.println( color ); // prints "black"
	System.out.println( super.color ); // prints "white" 
}
```
* If wanting to override the orignal method from the parent class, remember to use the __@Override__ annotation. This is to avoid a compiler warning (not neeeded but VERY good practice). Example:
```java
class A {
	String color = "white";
}

class B extends A {
	@Override
	String color = "black";
	System.out.println( color ); // prints "black"
}
```

## Polymorphism
* You can always pass an instance of a subclass to a parameter of its superclass type (but not visa versa). Using the example above, class B is a subtype of class A, but class A IS NOT a subtype of class B. 
* In simple terms, polymorphism means that a variable of a supertype can refer to a subtype object.
* Can cast a new instance of an object either implicitly or explicitly:
```java
// These create o, and both ARE allowed
Object o = new Student;
Student b = (Student)o;
o(new Student());

// The following is NOT allowed
Student b = o;
```
* The java __instanceof__ operator is used to test whether the object is an instance of the specified type, example:
```java
Class Animal{}
class Dog extends Animal {
	Dog d = new Dog();
	if ( d instaceof Animal )
		System.out.println( "Is an animal" ):
	else
		System.out.println( "Is not an animal" );
}
```

# Useful Tips
* If no inheritance is specified when a class is defined, the superclass of the class is Object by default. For example:
```java
// These two are equivalent
public class A {}
public class A extends Object{}
```
* This method tests whether two objects are equal, use the equals method from the Object class. Example: 
```java
object1.equals(object2);
```
* ArrayList is known as a generic class with a generic type _E_. An ArrayList stores an unlimited number of objects. Example:
```java
public class Garage {
	// Create ArrayList of objects (cars)
	ArrayList<String> cars = new ArrayList<String>();
	
	// Add cars to ArrayList
	cars.add("Volvo");
	cars.add("BMW");
	cars.add("Mazda");
	
	// Print out ArrayList
	System.out.println(cars);
  }
}
```
