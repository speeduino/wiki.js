File Structure
==============

Items must be arranged in the following sequence:

Header comment

1.  included files
2.  defines
3.  local struct typedefs
4.  local prototypes
5.  global vars
6.  main function (if present)
7.  local functions

In a C header (.h) file items must be arranged in the following sequence:

1.  Header comment
2.  ifndef guard
3.  included files
4.  defines
5.  struct typedefs
6.  prototypes
7.  (extern) global vars

Names
=====

All names should be meaningful and follow existing usage patterns if present.

Conventions
-----------

| Item                                        | Standard                                                     | Example                   |
|---------------------------------------------|--------------------------------------------------------------|---------------------------|
| Functions                                   | camelCase, lowercase first letter, no spaces or _           | readSensor();             |
| Variables                                   | sensorValue = 0;                                             |
| Anonymous variables (eg some loop counters) | Single lowercase letter (Preferred order or use: x, y, z, i) | x++;                      |
| Constants                                   | UPPER_CASE, words joined with _                            | 1.  define TWO_SQUARED 4 |

Layout
======

-   Use spaces for indents, not tabs
-   Indent 2 spaces per level
-   Always use { }, even for single statement blocks
-   Describe block structures using indentation, do not rely on { } alone
-   For multiple line blocks, brackets should always have their own line:

` void readSensors()`
` {`
`    analogRead(sensor1);`
`    analogRead(sensor2);`
` }  `

-   Single line blocks (if/else statements etc) should be on the same line and must includes braces
    -   When used on a single line, there should be a trailing space after the { and a preceding space before the }

` if(fanEnabled) { digitalWrite(fanPin, HIGH); }`

Declarations
============

-   Declare variables at the top of the function
-   In a block of related definitions vertically align the names, types, and initialisations
-   Initialise variables close to where they are first used.

Functions
=========

-   Put the return type on same line as function name
-   Functions should be kept as short, and broken into sub-functions as required
-   Each function should have a single clearly defined purpose, this purpose should be reflected in its name.

Executable Statements
=====================

-   One per line, not i=0; j=0;
-   Multiple operations are permitted per line where appropriate. Eg: i = j = 0;
-   True / False if statements should not use a comparison to 0 or 1. Eg:
    -   Good: if(isEnabled)
    -   Bad: if(isEnabled == 1)

don't use comma operator

Function definitions
====================

-   Use inline static for all non-interface functions
-   Use prototypes for all functions (even those returning int)
-   Don't turn parameter type checking off in prototypes with (), use (void) instead
-   Give sensible variable names in prototypes

Comments
========

-   Blocks comments should be used for any single comment longer than one line
-   Single comments are preferred at the end of a line rather than on their own line beforehand
