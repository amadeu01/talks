
## Playground Driven Development
#### Amadeu Cavalcante – @amadeu01


 oi 👋




---

### O que é Playground Driven Development?

- @note[Outra metodologia de desenvolvimento?]

- @note[Outro <Alguma coisa>DD]

- @note[É uma maneira fantástica de tentar coisas novas e, principalmente, testar UI]

---

### Quem usa isso ?

#### https://www.github.com/kickstarter/ios-oss

- @note[Kickstarter usou isso por um tempo. Mas, "esqueceram"]

- @note[Kickstarter é open source, então, pode dar uma olhar lá 😁]

- @note[A primeira vez que vi isso foi em uma palestra de um cara que costumava trabalhar no Kickstarter]

- @note[O carinha que apresentou isso Brandon Williams]

---

### Requirements

* Isolar views das regras de negócio @note[É fácil, porém um pouco chato. A view tem que poder trabalhar normalmente isolada de banco local, ou chamadas a internet. Você pode ter um "estado padrão" e só alterar o "estado" da sua aplicação e o `ViewController` terá que respeitar isso.]

---

### Requirements

* Isolar views das regras de negócio
* Sem side effects @note[O playground fica rodando loucamente, você não quer que ele fique travando por conta de requests, ou outras operações demoradas :P]

---

### Requirements

* Isolar views das regras de negócio
* Sem side effects
* Cocoa Framework - @note[Quando você tem um playground no projeto do xcode, ou em um workspace. Ele pode acessar os frameworks do seu projeto. No entanto, ele não pode acessar seus arquivos 😭 Como fazer isso então? Você cria um `Cocoa FrameWork`, coloca os arquivos que são importantes para o seu app lá, tirando o `AppDelegate`, e voilà. Você pode importar seu `Framework` no playground e, daí, é só sair usando hehe.]

---

### Requirements

* Isolar views das regras de negócio
* Sem side effects
* Cocoa Framework
* Inicializar os Bundles

^ O framework tem seu próprio

---

###  Pros

* Você ganhou isolação (Você se preocupou com o design da sua aplicação)
* Documentação em forma de playground (Um tipo de BDD)
* Mais fácil e rápido que o simulator
* Funciona com macOS, iOS, tvOS
* Apple todo dia coloca mais coisa para funcionar com playground (Até no ipad)

---

### Cons

* Playground nem sempre é seu amigo
* Você tem que estruturar um pouco mais seu app

- @note[Playground no Xcode 9 tava quebrando muito. No Xcode 10, tá funcionado melhor hehe]

- @note[As vezes, o Xcode fecha do nada 🙃]

- @note[Acho que estrurar o app é um ganho, como você ganharia com TDD]

---

# Demo Chinela App

- @note[Charts]

- @note[Elm]

^ Fazer um app diferente bem fácil

^ Brincar com constratins

^ Controlar tamanho de tela, texto, orientação

^ `layoutDirection: .rightToLeft`

^ Se você mudar algo no ChinelaFramework, você tem que buildar novamente, daí, só olhar no playground hehe

---

### Next steps

* Usar Screenshot testing (Tem uma lib do facebook)
* "Testar" o playground usando CI?

---

#### Playground Driven Development

Obrigado!!!  👋

#### Amadeu Cavalcante – @amadeu01
#### https://gitpitch.com/amadeu01/talks/playground-driven-development

#### Agradecimentos a minha mulher que me liberou da faxina para montar a apresentação hehe
