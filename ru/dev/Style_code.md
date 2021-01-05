---
title: Рруководство по стилю Style Guide
description: Style guidelines used within the Speeduino firmware
published: true
date: 2021-01-05T12:31:24.889Z
tags: 
editor: markdown
dateCreated: 2021-01-02T04:57:03.173Z
---

# Цель
Микропрограмма Speeduino стремится к общему, унифицированному подходу к компоновке кода на основе рекомендаций на этой странице. Любые запросы или представления должны в максимально возможной степени соответствовать этим рекомендациям.

## Замечания о соблюдении MISRA
Speeduino стремится к соблюдению стандарта кодирования MISRA C:2012, и многие из приведенных ниже конвенций должны соответствовать этому. Полное описание требований MISRA C:2012 выходит за рамки данного документа, но код включает скрипт сканирования MISRA, основанный на cppcheck, который можно использовать для проверки изменений кода

# Детали
## Структура файла

В программных кодах ('.ino') элементы должны располагаться в следующей последовательности:

1. Обязательный комментарий к заголовку, описывающий назначение файла
2. включенные файлы (`#include`)
3. определения (`#define`)
4. локальные типы структуры local struct typedefs
5. локальные прототипы local prototypes
6. Определения любых глобальных переменных global vars
7. Основная функция (при наличии) Main function
8. Локальные функции Local functions

В заголовке C (`.h`) элементы файла должны располагаться в следующей последовательности:

1.  Header comment
2.  ifndef guard
3.  included files (`#include`)
4.  defines (`#define`)
5.  struct typedefs
6.  prototypes
7.  (extern) global vars

## File Names
All names should be meaningful and follow existing usage patterns if present.

## Naming Conventions
| Item                                        | Standard                                                     | Example                   |
|---------------------------------------------|--------------------------------------------------------------|---------------------------|
| Functions                                   | camelCase, lowercase first letter, no spaces or _            | `readSensor();`           |
| Variables                                   | Same as functions                                            | `sensorValue = 0;`        |
| Anonymous variables (eg some loop counters) | Single lowercase letter (Preferred order or use: x, y, z, i) | `x++;`                    |
| Constants                                   | UPPER_CASE, words joined with _                              | `#define TWO_SQUARED 4`   |

## Layout and whitespace
-   Use spaces for indents, not tabs
-   Indent 2 spaces per level
-   Always use { }, even for single statement blocks
-   Describe block structures using indentation, do not rely on { } alone
-   For multiple line blocks, brackets should always have their own line:

```
void readSensors()
{
  analogRead(sensor1);
  analogRead(sensor2);
}
```

-   Single line blocks (if/else statements etc) should be on the same line and must includes braces
    -   When used on a single line, there should be a trailing space after the { and a preceding space before the }

` if(fanEnabled) { digitalWrite(fanPin, HIGH); }`

## Declarations
-   Declare variables at the top of the function
-   In a block of related definitions vertically align the names, types, and initialisations
-   Initialise variables close to where they are first used.

## Functions
-   Also put the return type on same line as function name
-   Functions should be kept as short, and broken into sub-functions as required
-   Each function should have a single clearly defined purpose, this purpose should be reflected in its name.

## Executable Statements
- One per line, not i=0; j=0;
- Multiple operations are permitted per line where appropriate. Eg: i = j = 0;
- True / False if statements should **always** use a comparison (Either to 0 or 1, or to `true` and `false`). Eg:
    -   Good: `if(isEnabled == 1)`
    -   Bad: `if(isEnabled)`
- Do no use comma operator for multiple variable definitions on a single line

## Function definitions
-   Use inline static for all non-interface functions
-   Use prototypes for all functions (even those returning int or void)
-   Don't turn parameter type checking off in prototypes with (), use (void) instead
-   Give sensible variable names in prototypes

## Comments
- Use of the Doxygen commenting syntax is STRONGLY recommended (http://www.doxygen.nl/manual/docblocks.html)
- Blocks comments should be used for any single comment longer than one line
- Single comments are preferred at the end of a line rather than on their own line beforehand