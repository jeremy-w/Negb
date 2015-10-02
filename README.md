This is a translation of the `negb_inverse` theorem from
[*Certified Programming with Dependent Types*][cpdt] into Swift.

Since Swift is not a proof assistant, the theorem is rendered as a generative
test using [SwiftCheck][]. For build-and-test convenience, a static snapshot
of SwiftCheck is packaged with the project.

The test cases also demonstrate how generative testing quickly finds the error
in a corrupted version of `negb` (Boolean negation) that always returns true.

This repository accompanies [an exploration][exploration] of this
in light of [a blog post](http://owensd.io/2015/09/03/dependent-types.html).

  [cpdt]: http://adam.chlipala.net/cpdt/
  [SwiftCheck]: https://github.com/typelift/SwiftCheck
  [exploration]: http://example.com/
