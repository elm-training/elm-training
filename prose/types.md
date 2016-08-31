# The Elm Type System


One of the promises of Elm is *NO RUNTIME ERRORS*. A huge part of why Elm can make this promise is the Elm type system. Let's learn a little bit about how it works, and how it can help us build more reliable programs that are easy to change.

## Objectives
* Explain what a type system is.
* Use Elm's built-in types.
* Use the `alias` keyword to create new type aliases
* Use record types to model data
* Use the `alias` keyword to give names to record types
* Explain what union types are
* Use union types to model a simple problem
* Know when you would use a union type vs a type alias
* Use union types that contain other data
* Create a type with a type variable
* Read the Elm function signature syntax
* Understand how type inference works in elm
* Write function signatures in Elm

## What is a type system?

Way down in the guts of a machine, your computer operates on bits. It's all just ones and zeroes. However, at the level we humans usually operate, we often attach different meanings to our ones and zeroes.

`1` is an integer, and there are a bunch of functions that know how to do things with integers. `'1'`, on the other hand, is a string. Some functions that do things with integers won't work on strings. Each piece of data has a `type`. The type of the data lets us know what operations we can perform on it. You could multiply a number, but you wouldn't multiply a string. On the other hand, you could capitalize a string, but you wouldn't capitalize an integer.

The type also communicates what it represents in our program. You might use strings to represent user's names, but you wouldn't normally use numbers to represent names unless you are a living in a creepy dystopian future.

Imagine that you had a giant pile of papers on your desk (or maybe you don't have to imagine if you are like me). You could just say they are all "papers", and then the only way to tell what kind of info they may contain would be by looking at each one. However, you could also divide these papers up by what *kind** of thing they are. Some of them are bills, some of them are stickers, some of them are embarrassing poetry you wrote to a middle-school crush. By grouping them by type, it is easier to understand what kind of data you have, and easier to make sure you don't do the wrong kind of thing with the wrong type of data. You probably want to pay bills and mail them off, but you definitely don't want to mail off your poor attempts at poetry.

A type system tells the computer what types of data functions take in and return. It can make sure you aren't doing something silly that would cause a crash, like multiplying a string by an array. The Elm type system also lets you create your own types to represent concepts specific to your application.


## Built-in types

(is this too much detail / too boring? also, should i introduce type signatures of functions before this?)
Elm has several built-in types. THIS IS BORING AN HORRIBLE

## Function signatures
One place you see the type system show up is in function signatures. Function signatures are basically instructions that tell Elm what kinds of data a function takes in and returns. They go on the line above the function, like this:

```elm
double : Number -> Number
double n = n * 2
```

Let's look at each piece to understand what is going on.

* `multiply` is the name of the function. Elm needs to know what function this signature applies to.
* Next we see the colon. This is just a separator between the function name and the argument list.
* `Number` is the type of the argument.
* `->` is the separator between the arguments.
* The last `Number` is the type that this function returns. The last thing in the function signature is always the return type.

If I wrote it out in English, here is how it would look.

"`double` is a function that takes in a `Number` and returns a `Number`.

### Exercises

* Write the function signature for a function named `capitalize` that takes in a `String` and returns a `String`.
* 

### Multiple arguments

What do you think this function signature means?

```elm
multiply : Number -> Number -> Number
```

"`multiply` takes in a `Number` and a `Number` and returns a `Number`.

One nice thing about function signatures is they often give you hints about what the function is doing. If you see a signature like this

## Type Aliases


## Union Types
