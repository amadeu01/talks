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
O que é _funcional_
No lugar de ter comportamento fortemete acoplado a estrutura de dados, você tem funções que irão
se combinar para poder transformar sua pedaço de dado.
Modularity: Rather than thinking of a program as a sequence of assignments and method calls, functional programmers emphasize that each program can be repeatedly broken into smaller and smaller pieces, and all these pieces can be assembled using function application to define a complete program. Of course, this decomposition of a large program into smaller pieces only works if we can avoid sharing state between the individual components. This brings us to our next point.
Escrever menos código.
Mais simples de fazer mudanças.
Conseguir trocar ideias com time mobile de outra plataforma mais facilmente.

---

### Background de mobile

---

### Swift

Note: What is the typing model?
How will you interact with it?
What are the core features that make the language unique?

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

@[3-6]
@[7-10]
@[11-14]
@[15-18]

---

### Kotlin

Note: What is the typing model?
How will you interact with it?
What are the decision constructs and core data structures?

+++

#### Exemplo

```kotlin
data class Position(val x: Double, val y: Double)

val Position.length: Double
	get() {
        return sqrt(x*x + y*y)
    }

fun Position.minus(other: Position): Position {
    return Position(x - other.x, y = other.y)
}
```

+++

```kotlin
typealias Region = (Position) -> Boolean

fun circle(radius: Double): Region {
    return { point -> point.length <= radius }
}

fun shift(region: Region, offset: Position): Region {
    return { point -> region(point.minus(offset)) }
}

fun invert(region: Region): Region {
  return { point -> !region(point) }
}

fun union(region: Region, other: Region): Region {
  return { point -> region(point) || other(point) }
}
```

@[3-6]
@[7-10]
@[11-14]
@[15-18]

---

### Elixir

Note: What is the typing model?
How will you interact with it?

---

### Elixir

#### Shell interativo

```elixir
➜ iex
Interactive Elixir (1.9.1) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)>
```

Note:
A forma mais fácil de começar a brincar com elixir é: começar um shell e tentar escrever algum código.
Uma dica legal, começar um projeto e usar `iex -S mix` para carregar o seu projeto

---

#### Shell interativo

```elixir
iex(2)> i [1, 2, 3]
Term
  [1, 2, 3]
Data type
  List
Reference modules
  List
Implemented protocols
  Collectable, Enumerable, IEx.Info, Inspect, List.Chars, String.Chars, Vex.Blank, Vex.Extract, Vex.Validator.Source

```

---

@snap[north-west span-40 text-08]
@box[](Puzzle)
@snapend

@snap[west span-60 text-center]

```Elixir
iex(1)> [1, 2, 3] |>
...(1)> Enum.map(fn x -> x * 10 end)
[10, 20, 30]
iex(2)> [1, 2, 3] |>
...(2)> Enum.map(fn x -> x + 10 end)
?
```

@snapend

@snap[north-east span-40 text-08]
@box[](Resposta)
@snapend

@snap[east span-40 text-08]
@box[](<br> 1. [1, 2, 3] <br><br> 2. ['\v\f\r'] <br><br> 3. [11, 12, 13])
@snapend

---

### Resposta

- 2. ['\v\f\r']

<br>

---

#### Explicação

```plain
Description
  This is a list of integers that is printed as a sequence of characters
  delimited by single quotes because all the integers in it represent printable
  ASCII characters. Conventionally, a list of Unicode code points is known as a
  charlist and a list of ASCII characters is a subset of it.
Raw representation
  [11, 12, 13]
```

---

#### Resolvendo o mesmo exemplo.

---

```elixir
defmodule Position do
  defstruct [:x, :y]

  def length(%Position{x: x, y: y}) do
    :math.sqrt(x*x + y*y)
  end

  def minus(%Position{x: lhs_x, y: lhs_y}, %Position{x: rhs_x, y: rhs_y}) do
    %Position{x: lhs_x - rhs_x, y: lhs_y - rhs_y}
  end
end
```

@[1]
@[2]
@[4,8]

+++

```elixir
defmodule Diagrams do

  def circle(radius) do
    fn point -> point |> Position.length <= radius end
  end

  def shift(region, opts \\ []) do
    fn point -> region.(Position.minus(point, opts[:offset])) end
  end

  def invert(region) do
    &(!region.(&1))
  end
end
```

@[3-5]
@[7-9]
@[10-12]

---

#### Explorando um pouco mais

```elixir
defmodule Curry do

  def curry(fun) do
    {_, arity} = :erlang.fun_info(fun, :arity)
    curry(fun, arity, [])
  end

  def curry(fun, 0, arguments) do
    apply(fun, Enum.reverse arguments)
  end

  def curry(fun, arity, arguments) do
    fn arg -> curry(fun, arity - 1, [arg | arguments]) end
  end

end
```

@[3,8,12]

---

@snap[north-west span-40 text-08]
@box[](Puzzle)
@snapend

@snap[west span-60 text-center]

```Elixir
iex(26)> curriedMap = curry(&Enum.map/2)
#Function<0.90432989/1 in Curry.curry/3>
iex(27)> incr = fn x -> x + 1 end
#Function<7.126501267/1 in :erl_eval.expr/5>
iex(28)> incr |>
...(28)> ([1, 2, 3] |> curriedMap.()).()
?
```

@snapend

@snap[north-east span-40 text-08]
@box[](Resposta)
@snapend

@snap[east span-40 text-08]
@box[](<br> 1. Error <br><br> 2. ['\a\b\c'] <br><br> 3. [2, 3, 4])
@snapend

---

### Resposta

- 3. [2, 3, 4]

<br>

---

#### Explicação

---

### Elixir

#### Onde posso começar ?

- https://elixir-lang.org/crash-course.html#modules
- https://elixirschool.com/en/
- https://elixircasts.io/

---

### Por hoje é só pessoal!

---

#### Vagas

<br>

![qrcode-pipefy](full_stack_pipefy.png)
