# Password Checker

Hi. This is a simple password tester, developed in Ruby with Rspec.

It is an academic software, created with training purposes.


### How it works?

It is a very simple software. The user will be asked for a password.

This password will receive one point for each password rule implemented.
For example, if there are 10 rules, the password will init with 10 points.

Then it will pass by the tests, and will lose one point for each unsatisfied condition.

When it finish passing through all rules, it will receive a score: There are 3 possible options:

* If the password finished with 0 to 1/3 of the points it started, the password is weak.
* If the password finished between 1/3 and 2/3 of the points it started, the password is medium.
* If the password finished between 2/3 and 3/3 of the points it started, the password is strong.


### What are the rules?

1. The password must contain at least 8 characters.
2. The password must contain at least a lowercase letter.
3. The password must contain at least a uppercase letter.
4. The password must contain at least a number.
5. The password must contain at least a symbol.
6. The password must not repeat 4 times the same character.
7. The password must not repeat consecutively 4 times the same character.
8. The password must not be a dictonary word.
9. The password must not have more than 4 vowels.
10. The password must be classified.

