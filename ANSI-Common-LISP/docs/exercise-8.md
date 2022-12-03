

# exercise-8

1.  [Is it possible for two symbols to have the same name but not be `eql`?](#org7c468ee)
2.  [Estimate the difference between&#x2026;](#org02bd9b6)
3.  [The call to `defpackage` on page 137&#x2026;](#orgaae8e12)
4.  [Add the code necessary to make&#x2026;](#orgef7dc33)
5.  [Write a program that can&#x2026;](#org75c0022)
6.  [Write a version of Henley that&#x2026;](#orged49ac1)


<a id="org7c468ee"></a>

## Is it possible for two symbols to have the same name but not be `eql`?

YES, symbol is substantial object just like list, two symbol have same may point to defferent objects.


<a id="org02bd9b6"></a>

## Estimate the difference between&#x2026;

2.Estimate the difference between the amount of memory used to represent the string "FOO" and the amount used to represent the symbol `foo`.

-   "FOO" just a string, store as ASCII code in memory in current package in lisp.
-   and `foo` is symbol, is a object, maybe refer to function, variable, property list, or name.


<a id="orgaae8e12"></a>

## The call to `defpackage` on page 137&#x2026;

3.The call to `defpackage` on page 137 used only strings as arguments. We could have used symbols instead. Why might this have been dangerous?

symbol is accessed in current package, not global accessible.


<a id="orgef7dc33"></a>

## Add the code necessary to make&#x2026;

4.Add the code necessary to make the code in Figure 7.1 be in a package named "RING", and that in Figure 7.2 be in a package named "FILE". The existing code should remain unchanged.([7.4 Example: String Substitution](chapter-7-4.md))

    (defpackage :com.string-substitution.ring
      (:use :common-lisp)
      (:export
       :new-buf :buf-insert :buf-pop :buf-next :buf-reset :buf-clear :buf-flush))
    
    (defpackage :com.string-substitution.file
      (:use :common-lisp :com.string-substitution.ring)
      (:export :file-subst))


<a id="org75c0022"></a>

## Write a program that can&#x2026;

5.Write a program that can verify whether or not a quote was produced by Henley ([section 8.8](section-8-8.md)).


<a id="orged49ac1"></a>

## Write a version of Henley that&#x2026;

6.Write a version of Henley that can take a word and generate a sentence with that word in the middle of it([section 8.8](section-8-8.md)).

