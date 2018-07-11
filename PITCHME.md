
# TDD

"Less time debugging, more time coding"

---

## The three laws of TDD

@ol

- You are not allowed to write any production code unless it is to make a failing unit test pass.
- You are not allowed to write any more of a unit test than is sufficient to fail; and compilation failures are failures.
- You are not allowed to write any more production code than is sufficient to pass the one failing unit test.

@olend

+++

1. Test suit runs.
2. Therefore, the code can be deployed.

---

### Why do we write bad code ?

@ul
It is impossible to write good code at first.
@ulend

+++

@div[center]
![](assets/images/parrot2.gif)
@divend

---

### Most developers think

@ul
- "TDD has to do with test"
@ulend

+++

### However

@ul
- "It has to do with designs" @note[The benefit of an isolated test is that you test one function at a time. Therefore, those tests put tremendous pressure on our designs, those tests are the ones that make most clear where our design problems are. The whole point of doing TDD is not doing with a test. One of the goals of test-driven development is to learn about the quality of our design. If our design has problems the test will be hard to write and the test will be hard to understand.]
@ulend

---

#### @size[1.3em](Example)

---

@div[center]
![](assets/images/parrot.gif)
@divend

---?gist=amadeu01/d2a41c12a77078670af8016217c24c96&lang=Kotlin&title=Twofer test

---?gist=amadeu01/add24ba3529fd8ce1b2a717bf5e65030&lang=Kotlin&title=Twofer implementation

---

### References

- [Refactoring: Improving the Design of Existing Code](https://www.amazon.com/gp/product/B007WTFWJ6/ref=as_li_qf_sp_asin_il_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=B007WTFWJ6&linkCode=as2&tag=masterprogram-20)
- [The Curious Case of Tautological TDD](http://blog.thecodewhisperer.com/permalink/the-curious-case-of-tautological-tdd)
- [How TDD Affects My Designs](http://blog.thecodewhisperer.com/permalink/how-tdd-affects-my-designs)
