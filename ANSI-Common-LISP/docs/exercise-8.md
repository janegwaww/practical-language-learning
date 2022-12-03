

# exercise-8

1.  [Is it possible for two symbols to have the same name but not be `eql`?](#org612b173)
2.  [Estimate the difference between&#x2026;](#org632dc82)
3.  [The call to `defpackage` on page 137&#x2026;](#org1742db1)
4.  [Add the code necessary to make&#x2026;](#org5f306af)
5.  [Write a program that can&#x2026;](#org1f80acb)
6.  [Write a version of Henley that&#x2026;](#org0d6dd82)


<a id="org612b173"></a>

## Is it possible for two symbols to have the same name but not be `eql`?

YES, symbol is substantial object just like list, two symbol have same may point to defferent objects.


<a id="org632dc82"></a>

## Estimate the difference between&#x2026;

2.Estimate the difference between the amount of memory used to represent the string "FOO" and the amount used to represent the symbol `foo`.

-   "FOO" just a string, store as ASCII code in memory in current package in lisp.
-   and `foo` is symbol, is a object, maybe refer to function, variable, property list, or name.


<a id="org1742db1"></a>

## The call to `defpackage` on page 137&#x2026;

3.The call to `defpackage` on page 137 used only strings as arguments. We could have used symbols instead. Why might this have been dangerous?

symbol is accessed in current package, not global accessible.


<a id="org5f306af"></a>

## Add the code necessary to make&#x2026;

4.Add the code necessary to make the code in Figure 7.1 be in a package named "RING", and that in Figure 7.2 be in a package named "FILE". The existing code should remain unchanged.([7.4 Example: String Substitution](chapter-7-4.md))

    (defpackage :com.string-substitution.ring
      (:use :common-lisp)
      (:export
       :new-buf :buf-insert :buf-pop :buf-next :buf-reset :buf-clear :buf-flush))
    
    (defpackage :com.string-substitution.file
      (:use :common-lisp :com.string-substitution.ring)
      (:export :file-subst))


<a id="org1f80acb"></a>

## Write a program that can&#x2026;

5.Write a program that can verify whether or not a quote was produced by Henley ([section 8.8](section-8-8.md)).

    (defun henley-text-p (text)
      (and (hash-table-p text)
           (random-next text)))


<a id="org0d6dd82"></a>

## Write a version of Henley that&#x2026;

6.Write a version of Henley that can take a word and generate a sentence with that word in the middle of it([section 8.8](section-8-8.md)).

    (defun generate-middle-text (prev)
      (let* ((choices (gethash prev *words*))
             (i (/ (reduce #'+ choices :key #'cdr) 2)))
        (dolist (pair choices)
          (if (minusp (decf i (cdr pair)))
              (return (car pair))))))

