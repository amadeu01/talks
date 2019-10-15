## Mobile 🤯 Elixir

<br>

oi
<br>

👋

---

### Paradigma Funcional

@ul

- O que é _funcional_?
- Como comecei a aplicar?
- Qual o motivo de começar a usar paradigma funcional em aplicações mobile?

@ulend

Note:
Modularity: Rather than thinking of a program as a sequence of assignments and method calls, functional programmers emphasize that each program can be repeatedly broken into smaller and smaller pieces, and all these pieces can be assembled using function application to define a complete program. Of course, this decomposition of a large program into smaller pieces only works if we can avoid sharing state between the individual components. This brings us to our next point.
Escrever menos código.
Mais simples de fazer mudanças.

---

#### Exemplo

Quero construir uma função que represente um diagrama.

+++

#### Exemplo

```swift
typealias Distance = Double

struct Position {
    var x: Double
    var y: Double
}

extension Position {
    var length: Double {
        return sqrt(x*x + y*y)
    }
}
```

+++

```swift zoom-01
typealias Region = (Position) -> Bool

func circle(radius: Distance) -> Region {
  return { point in point.length <= radius }
}

func shift(_ region: @escaping Region, by offset: Position) -> Region {
  return { point in region(point - offset) }
}

func invert(_ region: @escaping Region) -> Region {
  return { point in !region(point)}
}

func union(_ region: @escaping Region, with other: @escaping Region) -> Region {
  return { point in region(point) || other(point) }
}
```

@[3,6]
@[7,10]
@[11-14]
@[15-18]

---

### Background de mobile

---

### Swift

Note: What is the typing model?
How will you interact with it?
What are the core features that make the language unique?

+++

#### Swift

<br>

@ul

- Protocol Oriented Programming
- Tipo por valor e por referência
- Tupla e multiplo retornos
- Generics ♥
- `*` Extensions
- Pattern Match
- Functional (Prelude)

@ulend

+++

#### Swift

<br>

Objective-C

Note:

---

### Kotlin

Note: What is the typing model?
How will you interact with it?
What are the decision constructs and core data structures?

+++

#### Kotlin

<br>

@ul

- Contracts ♥️
- `*` Data class
- Extensions
- Functional (Arrow)
- Lambda expressions + Inline functions = Inner DSL

@ulend

+++

#### Kotlin

<br>

Java / JVM

Note:
🤔 Multiplataforma

---

### Elixir

Note: What is the typing model?
How will you interact with it?

---

---

### Elixir

- https://elixir-lang.org/crash-course.html#modules
