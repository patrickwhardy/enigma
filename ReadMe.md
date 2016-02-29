# Enigma

* [original assignment](https://github.com/turingschool/curriculum/blob/master/source/projects/enigma.markdown)
* [Evaluation](ruby-submissions/1602/enigma/patrick_hardy.md)

## Enigma is an encryption engine that generates a a random key and date-based offset to encrypt, decrypt or crack any string ending in "..end.."

### Enigma can be run directly as follows:
```
> require './lib/enigma'
> e = Enigma.new
> my_message = "this is so secret ..end.."
> output = e.encrypt(my_message)
=> # encrypted message here
> output = e.encrypt(my_message, "12345", Date.today) #key and date are optional (gen random key and use today's date)
=> # encrypted message here
> e.decrypt(output, "12345", Date.today)
=> "this is so secret ..end.."
> e.decrypt(output, "12345") # Date is optional (use today's date)
=> "this is so secret ..end.."
> e.crack(output, Date.today)
=> "this is so secret ..end.."
> e.crack(output) # Date is optional, use today's date
=> "this is so secret ..end.."
```
## Learning Goals
* Practice breaking a program into logical components
* Testing components in isolation and in combination
* Applying Enumerable techniques in a real context
* Reading text from and writing text to files
