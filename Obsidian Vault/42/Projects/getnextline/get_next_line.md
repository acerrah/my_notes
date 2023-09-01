- - -
""----

**Page:** [[Homepage]]/[[42 Notes]]/[[get_next_line]]

---
# Contents
- ### [[#Introduction]]
	-  [[#Common Instructions]]
	-  [[#What is get_next_line?]]
	-  [[#What will you be learning?]]
- ### [[#Mandatory Part]]
- ### [[#Bonus Part]]
- ### [[#Sources]]

- - -
# How to use this documentation?
**Please!** After reading texts **do not open codes** immediately. **Try coding it yourself** then check the code to see differences. Otherwise it will effect your learning process in a bad way and keep you from improving your thinking and algrotihm.
- - -
# Introduction
## Common Instructions
• Your project must be written in C.  
• Your project must be written in accordance with the Norm. If you have bonus files/functions, they are included in the norm check and you will receive a 0 if there is a norm error inside.  
• Your functions should not quit unexpectedly (segmentation fault, bus error, double free, etc) apart from undefined behaviors. If this happens, your project will be considered non functional and will receive a 0 during the evaluation.  
• All heap allocated memory space must be properly freed when necessary. No leaks will be tolerated.  
• If the subject requires it, you must submit a Makefile which will compile your source files to the required output with the flags -Wall, -Wextra and -Werror, use cc, and your Makefile must not relink.  
• Your Makefile must at least contain the rules $(NAME), all, clean, fclean and re.  
• To turn in bonuses to your project, you must include a rule bonus to your Makefile, which will add all the various headers, librairies or functions that forbidden on  
the main part of the project. Bonuses must be in a different file _bonus.{c/h} if the subject does not specify anything else. Mandatory and bonus part evaluation  
is done separately. • If your project allows you to use your libft, you must copy its sources and its  
associated Makefile in a libft folder with its associated Makefile. Your project’s Makefile must compile the library by using its Makefile, then compile the project.  
• We encourage you to create test programs for your project even though this work won’t have to be submitted and won’t be graded. It will give you a chance  
to easily test your work and your peers’ work. You will find those tests especially useful during your defence. Indeed, during defence, you are free to use your tests  
and/or the tests of the peer you are evaluating.  
• Submit your work to your assigned git repository. Only the work in the git repository will be graded. If Deepthought is assigned to grade your work, it will be done after your peer-evaluations. If an error happens in any section of your work during Deepthought’s grading, the evaluation will stop.
## What is get_next_line?
Get next line is a function that lets you get the next line from a file. It doesn't forget where it was and continues from there.
## What will you be learning?
 - Static variables
 - Using functions like read and open in unistd library
- - -
## Mandatory Part

Get next line wants us to read a file and return the first line at first usage. Then the second line at the second usage. But how do we do it?

First of all, let's start with how to read a file? To read a file we need to open a file descriptor:

``` ad-example
~~~c
#include <unistd.h>

int main()
{
	int fd = open("test.txt", O_RDWR); //RDWR means read and write only
	char *buff;
	buff = malloc(11);
	//we are opening 101 bytes because we will read 10 characters and we also want to add a null to the end
	read(fd, buff, 10); 
	//read function takes 3 parameters
	//file descriptor, buffer to read data into and buffer size
	//read function returns number of bytes read on success
	//returns 0 on reaching end of file
	//returns -1 on error
	//returns -1 on signal interrupt
	close(fd);
	//it is best to close the fd after we are doen with it so it won't keep our memory busy
	//also if you made a change in the file it wouldn't change before closing it
}
``` 

Let's say our "test.txt" file contains:
```
cerrah
lmao
```

That means our buff will be "cerrah/nlma/0".
In this example we learned how to open a fd , read from it and close it. But as we can see read function only reads as much as we specified it. How do we read until we get a full line?
	If it is hard to read you can go to original [[first flowchart.svg]]
![[first flowchart.svg]]

Now our function reads until a newline wonderful. But there is still two big problems. First, because we read as much as BUFFER_SIZE we can easily pass the new line and return something more. Second, our function won't know where it was. (But read will remember where it read lastly it is read functions feature)

Now that we know what our problems we can continue adding more to fix them.First of all lets make the last flowchart into a function:

![[get_buffer.svg]]

Now that we can use our function we know what el se we need. To make our function remember where we left we will use something called static variables. When a variable is static it won't change even the function ends. It will only defined once and program knows that it is already defined if it sees the defining again:

``` ad-example
~~~c
#include <stdio.h>

int xd()
{
	static int i = 5; //when we use xd function for the first time i will be defined
	// after the first use this line will be skipped 
	i -= -1;
	return i;
}

int main()
{
	printf("%d", xd()); //this will print 4
	printf("%d", xd()); //this will print 3
}
``` 

With static variables we can remember where we left reading. But the first problem still stands. We can pass the new line while reading. If we pass the new line we can just return before the new line and keep the part from new line to end in a static variable. 

![[simpleversion.svg]]

In a simple way, this algortihm should work. But how do we code it? What if we don't send fd, is it protected? For now it isn't but the algorithm should work.

Now try coding it yourself. After that you can check for your mistakes at my github page: 
	github.com/acerrah

## Bonus Part

Bonus part of this project is really simple. It wants you to handle more than one fd at the same time. You just gotta change buffer into a double array like this, so it can remember where it was for every fd:

``` ad-example
~~~c
static char *buffer[256];
```

And ofcourse, you must change it in everywhere you used buffer. But why we do this? Why the magical number is 256 and not anythin else?

Every OS has a maximum amount of files can be opened at the same time.  To safely open files in a Mac OS deafult limit is 256. You can check it by typing ``` ulimit -n``` at your terminal. If you want more details about ulimit, you can check its man page. Basically we are limiting our double array to get as much as our system can handle. Yes, it varies from system to system but in this project we want it to work on our system. 
- - -
## Sources
github.com/acerrah
www.geeksforgeeks.org