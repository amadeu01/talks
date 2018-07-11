
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

#### @size[1.3em](Example)

---

@div[center]
![](assets/images/parrot.gif)
@divend

---

---?gist=amadeu01/add24ba3529fd8ce1b2a717bf5e65030&lang=Kotlin&title=Twofer implementation

---

---?gist=amadeu01/d2a41c12a77078670af8016217c24c96&lang=Kotlin&title=Twofer test
