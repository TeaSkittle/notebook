# Pointers

### Basics
* A pointer is just a variable that holds a memory address
* _&_ = get address of variable, example:
```c
int a = 5;
int *b = &a;
    // *b means to make b a pointer
    // b = location of "a" in memory, not the number 5
```
* _*_ = get the value at the location pointed to, example:
```c
int c = *b;
    // points to b, which get the value of (&a), which is a = 5
    // thus c = 5
```
* If incr/decr an pointer, use sizeof(), since we are actually incr/decr the memory address, not the value of the variable pointed to, example:
```c
int *b = &a;
b = b + 1;   // just adds 4 bytes
b = b + sizeof(int);
    /* adds full 32 bytes(what and int is, actually increments the
	   address properly */
```

### Structs
* -> is used with pointing to something inside a struct, example:
```c
struct dog{
    char name[10];
	int age;
};
struct dog my_dog = {"scooby", 5};
struct dog *ptr_dog;
// Here are the pointers, changing values in the my_dog struct
ptr_dog->age++;
strcpy(ptr_dog->name, "scrappy")
/* Dog's name is now = scrappy
    Dog's age is now =  6 */
```

### Simple example
* Usage of a pointer, make b = a
```c
int a = 5;
int *b = &a;
printf("b = %d\n", *b);
b = 5
```
