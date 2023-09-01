----

**Page:** [[Homepage]]/[[42 Notes]]/[[Libft]]

---
# Contents
- ### [[#Introduction]]
	-  [[#Common Instructions]]
	-  [[#What is Libft?]]
	-  [[#What will you be learning?]]
- ### [[#Mandatory Part]]
	- [[#Header File]]
	-  [[#Makefile]]
	-  [[#Part 1 - Libc Functions]]
	-  [[#Part 2 - Additional Functions]]
- ### [[#Bonus Part]]
- ### [[#Sources]]

- - -
# How to use this documentation?
**Please!** After reading texts **do not open codes** immediately. **Try coding it yourself** then check the code to see differences. Otherwise it will effect your learning process in a bad way and keep you from improving your thinking and algrotihm.
- - -
# Introduction
## Common Instructions
 - Project must be written in C (obviously).
 - Project must be written according to Norm.
 - Functions should not quit unexpectedly (seg fault, bus error etc) apart from undefined behaviors.
 - No leaks are tolerated.
 - Project needs a makefile that compiles with -Wall -Werror -Wextra flags.
 - Makefile must at least contain $(NAME), all ,clean, fclean and re.
 - To turn in there should be a bonus rule in Makefile.
## What is Libft?
 Libft is a C library for many of your needs in your 42 student life. In many of your future projects you will be using Libft (unless said otherwise). 
## What will you be learning?
 - How to create libraries?
 - New functions and libraries
 - File descriptors
 - Structs
- - -
## Mandatory Part
### Header File
Header file is where you will define all your functions and your library itself. It is also a place for you to define other libraries, variables and macros. 
``` ad-example
title: Header
collapse: close
~~~c
//"ifndef" grants ability to be not defined if it is already defined. Without ifndef we gave same decleration twice, code would crash. While definening instead of '.' we use '_' and we use all capitalized characters.

#ifndef LIBFT_H
# define LIBFT_H
//these libraries are the only ones you will need in your project (Except your own libft library. Try using your library as much as you could and don't rewrite a function you already made.)
# include <stddef.h>
# include <unistd.h>
# include <stdlib.h>

//this a linked struct that we need to use in Bonus Part we will be explaining it in the future.
//DO NOT SKIP BONUS OF LIBFT IT IS IMPORTANT
typedef struct     s_list
{
	void*content;
	struct s_list *next;
}    t_list;


//these are the functions that you will write and to use them you need to define them in your other projects instead of writing every one of them you can write all of them inside your header file and insert your header file.
int ft_tolower(int c);
int ft_toupper(int c);
char *ft_strrchr(const char *s, int c);
char *ft_strmapi(char const *s, char (*f)(unsigned int, char));
size_t ft_strlen(const char *str);
size_t ft_strlcpy(char *dest, const char *src, size_t size);
size_t ft_strlcat(char *dest, const char *src, size_t size);
char *ft_strchr(const char *s, int c);
void *ft_memset(void *s, int c, size_t n);
void *ft_memcpy(void *dst, const void *src, size_t n);
char *ft_itoa(int n);
int ft_isprint(int c);
int ft_isdigit(int c);
int ft_isascii(int c);
int ft_isalpha(int c);
int ft_isalnum(int c);
void *ft_calloc(size_t count, size_t size);
void ft_bzero(void *s, size_t n);
int ft_strncmp(const char *s1, const char *s2, size_t n);
void *ft_memchr(const void *s, int c, size_t n);
char *ft_strnstr(const char *haystack, const char *needle, size_t len);
void *ft_memmove(void *dest, const void *src, size_t n);
int ft_memcmp(const void *s1, const void *s2, size_t n);
int ft_atoi(const char *s);
char *ft_strdup(const char *s1);
char *ft_strjoin(char const *s1, char const *s2);
char *ft_substr(char const *s, unsigned int start, size_t len);
char *ft_strtrim(char const *s1, char const *set);
char **ft_split(char const *s, char c);
void ft_putchar_fd(char c, int fd);
void ft_putstr_fd(char *s, int fd);
void ft_putendl_fd(char *s, int fd);
void ft_putnbr_fd(int n, int fd);
void ft_striteri(char *s, void (*f)(unsigned int, char*));
t_list *ft_lstnew(void *content);
void ft_lstadd_front(t_list **lst, t_list *new);
int ft_lstsize(t_list *lst);
t_list *ft_lstlast(t_list *lst);
void ft_lstadd_back(t_list **lst, t_list *new);
void ft_lstdelone(t_list *lst, void (*del)(void*));
void ft_lstclear(t_list **lst, void (*del)(void*));
void ft_lstiter(t_list *lst, void (*f)(void *));
t_list *ft_lstmap(t_list *lst, void *(*f)(void *), void (*del)(void *));

#endif
//endif closes the ifndef

````

### Makefile
Make is a build [[build automation]] tool that automatically builds executable programs and libraries from source code by reading from files called **Makefiles** how to derive the target program. But in this project we will only use it to create our library.
Make is used with a list of target file names to buils as command-line arguments:

		 make [TARGET ...]

To use Make you first need to create a Makefile. In the most basic Makefile you will have your input files, output files, gcc and archive command.
``` ad-example
title: Makefile
collapse: close
~~~make
SRCS =  ft_isalpha.c \
		ft_isdigit.c \
		ft_isalnum.c \
		ft_isascii.c \
		ft_isprint.c\
		ft_strlen.c \
		ft_bzero.c \
		ft_memset.c \
		ft_memcpy.c \
		ft_calloc.c \
		ft_strmapi.c \
		ft_toupper.c \
		ft_tolower.c \
		ft_itoa.c \
		ft_strchr.c \
		ft_strrchr.c \
		ft_strlcpy.c \
		ft_strlcat.c \
		ft_strncmp.c \
		ft_memchr.c \
		ft_memmove.c \
		ft_memcmp.c \
		ft_strnstr.c \
		ft_atoi.c \
		ft_strdup.c \
		ft_strjoin.c \
		ft_substr.c \
		ft_strtrim.c \
		ft_split.c \
		ft_putchar_fd.c \
		ft_putstr_fd.c \
		ft_putendl_fd.c \
		ft_putnbr_fd.c \
		ft_striteri.c

MAIN = main.c
OBJS = ${SRCS:.c=.o}
NAME = libft.a
CC = gcc
CFLAGS = -Wall -Werror -Wextra -g
RM = rm -rf
LIBC = ar rc

all: ${NAME}

${NAME}: ${OBJS}

${LIBC} ${NAME} ${OBJS}

clean:
	${RM} ${OBJS} ${BOBJS}

fclean: clean
	${RM} ${NAME}

re: fclean all
````

### Part 1 - Libc Functions
	Note: Every function must start with 'ft_' prefix. For instance strlen becomes ft_strlen.

- #### isalpha
	isalpha checks your argument c is  alphabetical or not. If it is alphabetical it returns 1 else it returns 0.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

int ft_isalpha(int c)

{
	return ((c >= 97 && c <= 122) || (c >= 65 && c <= 90));
}
````
- #### isdigit
	isdigit checks your argument c is a digit or not. If it is a digit it returns 1 else it returns 0. 
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

int ft_isdigit(int c)

{
	return (c >=48  && c <= 57);
}
````
- #### isalnum
	isalnum check c is alphabetical character or a digit. If it is one of them it returns 1 else it returns 0.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

int	ft_isalnum(int c)
{
	return (ft_isalpha() || ft_isdigit());
}
````
- #### isascii
	Ascii characters are stored in 7 bits which means all of them are between 0 and 127 which makes 128 characters at total. So is ascii will be looking if argument c is between 0 and 127.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

int	ft_isalnum(int c)
{
	return ((c >= 97 && c <= 122) || (c >= 65 && c <= 90) || (c <= 57
			&& c >= 48));
}
````
- #### isprint
	In ascii table non printable characters are between 0 and 31 (both included). 127 which is delete character in ascii table is printable because it makes a change on the text. So isprint looks characters between 32 and 127(both included). If they are between, it returns 1 else it returns 0.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

int	ft_isprint(int c)
{
	return (c >= 32 && c <= 126);
}
````
- #### strlen
	```ad-note
	**"const"** keyword specifies that the object isn't modifiable.
	- "char const c;" means c can't be changed.
	- "char const c" and "const char c" is the same thing but to avoid confusion **always** append the const qualifer
	- "char * const c;" means the address of the pointer can't be changed.
	- "char const * c;" the pointer adresses to c variable that can't be changed
	- "char const * const c;" the pointer whose adress can't be changed addresses to c variable that can't be changed as well .
	```

	Strlen takes a constant string and calculates the length of the given string. It takes const char pointer as argument and returns its length as size_t.

	```ad-note
	What is "size_t"? Different systems can handle different size of objects. "size_t" is a type that is used to represent the size of object in bytes. It can handle the biggest object that system can handle. If the compiler is 32 bit then size_t is a typedef for unsigned int but if the compiler is 64 bit size_t is a typdef for unsigned long long. The "size_t" is never negative because you can't mallocate negative sizes in the memory.
	````
- #### memset
	Memset is used to fill a part of the function with a character. It takes 3 parameters first one a void pointer to start point of the array, second one is the character that is used as filler, third and last one is how many characters we are going to change.

	If ft_memset was used as in the example:
	````c
	char a[] = "hello world";
	ft_memset(a, 'x', 5);
	````
	Variable "a" would be "xxxxx world" and return value would be void pointer "s" we took as parameter.

``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

void	*ft_memset(void *s, int c, size_t n)
{
	size_t	i;

	i = 0;
	while (i < n)
		((unsigned char *)s)[i++] = c;
	return (s);
}
````
- #### bzero
	Bzero kinda works like memset but instead of filling with the specified character it always fills with zeros and does not return anything.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

void	ft_bzero(void *s, size_t n)
{
	size_t	i;

	i = 0;
	while (i < n)
		((unsigned char *)s)[i++] = '\0';
}
````
- #### memcpy
	Memcpy copies specified size characters from source to destination. It returns a pointer to destination.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

void	*ft_memcpy(void *dst, const void *src, size_t n)
{
	size_t	i;

	if (!dst && !src)
		return (NULL);
	i = 0;
	while (i < n)
	{
		*(char *)(dst + i) = *(char *)(src + i);
		i++;
	}
	return (dst);
}
````
- #### memmove
	Memmove copies specified size characters from source to destination just as memcpy but it can handle overlapping memories. For an example:
	```c
	char xd[] = "42 is awesome";
	//because memcpy copies one character at a time overlapping memory can cause issues
	memcpy(&xd[1], &xd[2], 3);
	//42 is awesome -> 422is awesome
	//422is awesome -> 4222s awesome
	//4222s awesome -> 42222 awesome
	// instead of becoming "422 i awesome" it becomes "42222 awesome because it copies the character that is already changed"
	```
	Memmove prevents this problem by copying from left to right and right to left depending on the situation. If first address is coming before the second address it copies from right to left else left to right.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

void	*ft_memmove(void *dest, const void *src, size_t n)
{
	size_t	i;

	if (!src && !dest)
		return (0);
	if (((size_t)dest - (size_t)src < n) && dest > src)
	{
		i = n - 1;
		while (i < n)
		{
			*(char *)(dest + i) = *(char *)(src + i);
			i--;
		}
	}
	else
	{
		i = 0;
		while (i < n)
		{
			*(char *)(dest + i) = *(char *)(src + i);
			i++;
		}
	}
	return (dest);
}
````
- #### strlcpy
	Strlcpy works just like memcpy but it is meant for strings and stops when it sees null.  It returns the source's length. 
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

size_t	ft_strlcpy(char *dst, const char *src, size_t dstsize)
{
	size_t	i;

	i = 0;
	if (dstsize)
	{
		while (i < (dstsize - 1) && *(src + i))
		{
			*(dst + i) = *(src + i);
			i++;
		}
		*(dst + i) = '\0';
	}
	return (ft_strlen(src));
}
````
- #### strlcat
	Strlcat appends one string onto the end of the other. You can specify how many characters you are going to append. It returns the end string's length.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

size_t	ft_strlcat(char *dest, const char *src, size_t size)
{
	size_t	i;

	if (!dest && !size)
		return (0);
	i = ft_strlen(dest);
	if (i >= size)
		return (ft_strlen(src) + size);
	ft_strlcpy((dest + i), src, size - i);
	return (i + ft_strlen(src));
}
````
- #### toupper
	Toupper takes a character, if the character is lowercase and alphabetical, it subtractes 32 so it will be the same character but uppercase. Returns the latest version of the character.
``` ad-example
title: Code
collapse: close
~~~c
##include "libft.h"

int	ft_toupper(int c)
{
	if ((unsigned char)c < 123 && (unsigned char)c >= 97)
	{
		c -= 32;
	}
	return ((unsigned char)c);
}
````
- #### tolower
	Opposite of the toupper. If the character is uppercase, function adds 32 to it. Returns the latest version of the character.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

int	ft_tolower(int c)
{
	if ((unsigned char)c <= 90 && (unsigned char)c >= 65)
	{
		c += 32;
	}
	return ((unsigned char)c);
}
````
- #### strchr
	Strchr search for a specific character's first occurence in the string pointed by the given argument. Returns a pointer to the first occurence.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

char	*ft_strchr(const char *s, int c)
{
	int	i;

	i = 0;
	if (!s && *s != 0)
		return (0);
	while (s[i] != 0)
	{
		if (s[i] == (char)c)
		{
			return ((char *)(s + i));
		}
		i++;
	}
	if ((char)c == s[i])
		return ((char *)(s + i));
	return (0);
}
````
- #### strrchr
	Works like strchr but for the last occurence of the character.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

char	*ft_strrchr(const char *s, int c)
{
	int	i;

	i = ft_strlen(s);
	if (!s && *s != 0)
		return (0);
	while (i >= 0)
	{
		if (s[i] == (char)c)
		{
			return ((char *)(s + i));
		}
		i--;
	}
	if ((char)c == s[i])
		return ((char *)(s + i));
	return (0);
}
````
- #### strncmp
 Strncmp compares stated times of bytes of one string to another string. It returns first different character's result of subtraction. Always first string minus the second one.
	 ``` ad-note
	 If the return value is bigger then zero first string is greater. If the return value is zero then first and second strings' compared parts are same. If the return value is smaller than zero then second string is greater.
	```
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

int	ft_strncmp(const char *s1, const char *s2, size_t n)
{
	size_t	i;

	i = 0;
	while ((s1[i] != 0 || s2[i] != 0) && i < n)
	{
		if (s1[i] != s2[i])
			return ((unsigned char)s1[i] - (unsigned char)s2[i]);
		i++;
	}
	return (0);
}
````
- #### memchr
	 Memchr searches for the first occurence of the specified character in stated number of bytes in the pointed list. Returns a pointer to the matching byte.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

void	*ft_memchr(const void *s, int c, size_t n)
{
	size_t	i;

	i = 0;
	while (i < n)
	{
		if (*(unsigned char *)(s + i) == (unsigned char)c)
			return ((void *)(s + i));
		i++;
	}
	return (NULL);
}
````
- #### memcmp
	Same as strncmp, only difference is memcmp takes 2 void pointers while strcmp takes 2 char pointers.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

int	ft_memcmp(const void *s1, const void *s2, size_t n)
{
	size_t	i;

	i = 0;
	while (i < n)
	{
		if (*(unsigned char *)(s1 + i) != *(unsigned char *)(s2 + i))
			return (*(unsigned char *)(s1 + i) - *(unsigned char *)(s2 + i));
		i++;
	}
	return (0);
}
````
- #### strnstr
	Searches for a string in the other string, where not more than stated number of characters are searched.It doesn't search after first '\0' character. If the string we are searching for is empty it returns the other string. If the first string occurs nowhere in the secon string NULL is returned; otherwise pointer to first occurence's first character is returned.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

char	*ft_strnstr(const char *haystack, const char *needle, size_t len)
{
	size_t	i;
	size_t	n;
	size_t	flag;
	size_t	needle_len;

	needle_len = ft_strlen(needle);
	i = 0;
	if (!needle_len)
		return ((char *)(haystack));
	else if (len == 0 || !haystack[0])
		return (0);
	while (i < len)
	{
		n = i;
		flag = 0;
		while ((*(needle + flag) == *(haystack + n)) && *(needle + flag) != '\0'
			&& n++ < len)
			flag++;
		if (flag == needle_len)
			return ((char *)(haystack + i));
		i++;
	}
	return (0);
}
````
- #### atoi
 Atoi takes a string and converts it to integer. Returns the converted number. If no valid conversion could be performed, it returns zero. 
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

int	ft_atoi(const char *s)
{
	int		i;
	long	back;
	int		np;

	back = 0;
	np = 1;
	i = 0;
	while ((s[i] <= 13 && s[i] >= 9) || s[i] == 32)
		i++;
	if (s[i] == 43 || s[i] == 45)
	{
		if (s[i] == 45)
			np *= -1;
		i++;
	}
	while (s[i] >= 48 && s[i] <= 57)
	{
		back = back * 10 + (s[i] - 48) * np;
		if (back > 2147483647)
			return (-1);
		if (back < -2147483648)
			return (0);
		i++;
	}
	return ((int)back);
}
````
- #### calloc
 Calloc takes two parameters. First is count, second is size. Then it allocates count times size bytes in memory and initializes each block with '0'. It returns a pointer to start of allocated area.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

void	*ft_calloc(size_t count, size_t size)
{
	void	*rtn;
	size_t	req;

	req = count * size;
	rtn = malloc(req);
	if (!rtn)
		return (0);
	ft_memset(rtn, 0, req);
	return (rtn);
}
````
- #### strdup
	Strdup takes a string and duplicates it and returns the duplicated string.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

char	*ft_strdup(const char *s1)
{
	char	*rtn;
	size_t	len;

	len = ft_strlen(s1) + 1;
	rtn = ft_calloc(len, sizeof(char));
	if (!rtn)
		return (0);
	ft_strlcpy(rtn, s1, len);
	return (rtn);
}
````

## Part 2 - Additional Functions

- #### substr
	Allocates and returns a substring from the string 's'. The substring begins at index 'start' and is of maximum size 'len'.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

char	*ft_substr(char const *s, unsigned int start, size_t len)
{
	char	*rtn;
	size_t	i;

	if (!s)
		return (0);
	if (ft_strlen(s) < start)
		return (ft_strdup(""));
	if (len > ft_strlen(s) - start)
		len = ft_strlen(s) - start;
	i = 0;
	rtn = ft_calloc(len + 1, sizeof(char));
	if (!rtn)
		return (NULL);
	rtn[len] = 0;
	while (i < len)
		rtn[i++] = s[start++];
	return (rtn);
}
````
- #### strjoin
	Allocates and returns a new string, whixh is the result of the concatenation of 's1' and 's2'.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

char	*ft_strjoin(char const *s1, char const *s2)
{
	char	*back;
	size_t	total_len;

	if (!s1 || !s2)
		return (0);
	total_len = (ft_strlen(s1) + ft_strlen(s2)) + 1;
	back = malloc(total_len * sizeof(char));
	if (!back)
		return (0);
	ft_strlcpy(back, s1, ft_strlen(s1) + 1);
	ft_strlcat(back, s2, total_len);
	return (back);
}
````
- #### strtrim
	Allocates and returns a copy of 's1' with the characters specified in 'set' removed from the beginning an the end of the string.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

char	*ft_strjoin(char const *s1, char const *s2)
{
	char	*back;
	size_t	total_len;

	if (!s1 || !s2)
		return (0);
	total_len = (ft_strlen(s1) + ft_strlen(s2)) + 1;
	back = malloc(total_len * sizeof(char));
	if (!back)
		return (0);
	ft_strlcpy(back, s1, ft_strlen(s1) + 1);
	ft_strlcat(back, s2, total_len);
	return (back);
}
````
- #### split
	Allocates and returns an array of strings obtained by splitting 's' using the character 'c' as a delimiter. The array must end with a NULL pointer.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

size_t	ft_word_count(char const *s, char c)
{
	size_t	i;
	size_t	rtn;

	i = 0;
	rtn = 0;
	while (s[i])
	{
		if (s[i] == c && s[i + 1] != c && s[i + 1] != 0)
			rtn++;
		i++;
	}
	if (s[0] != c)
		rtn++;
	return (rtn);
}

char	**protect(void)
{
	char	**rtn;

	rtn = ft_calloc(1, sizeof(char *));
	rtn[0] = NULL;
	return (rtn);
}

char	**ft_split(char const *s, char c)
{
	char	**rtn;
	size_t	word_count;
	size_t	i;
	size_t	j;
	size_t	flag;

	i = 0;
	j = 0;
	if (!s || s[0] == 0)
		return (protect());
	word_count = ft_word_count(s, c);
	rtn = ft_calloc(word_count + 1, sizeof(char *));
	if (!rtn)
		return (NULL);
	while (i < word_count)
	{
		while (s[j] == c)
			j++;
		flag = j;
		while (s[j] != c && s[j])
			j++;
		rtn[i++] = ft_substr(s, flag, j - flag);
	}
	rtn[i] = NULL;
	return (rtn);
}
````
- #### itoa
	Allocates and returns a string representing the integer recevied as an argument. Negative numbers must be handled.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

int	arlen(int n)
{
	long	a;
	int		i;

	i = 0;
	a = n;
	if (a == 0)
		return (1);
	if (a < 0)
	{
		a *= -1;
		i++;
	}
	while (a > 0)
	{
		a /= 10;
		i++;
	}
	return (i);
}

void	inarr(char *back, int a, int backlen)
{
	long	n;

	n = a;
	if (n < 0)
	{
		back[0] = '-';
		n *= -1;
	}
	if (n >= 10)
	{
		inarr(back, n / 10, backlen - 1);
		inarr(back, n % 10, backlen);
	}
	if (n < 10)
		back[backlen] = n + 48;
}

char	*ft_itoa(int n)
{
	int		backlen;
	char	*back;

	backlen = arlen(n);
	back = malloc((sizeof(char) * backlen) + 1);
	if (!back)
		return (0);
	inarr(back, n, backlen - 1);
	back[backlen] = '\0';
	return (back);
}
````
- #### strmapi
	Applies the function 'f' to each character of the string 's', and passing its index as first argument to create a new string resulting from successive applications of 'f'.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

char	*ft_strmapi(char const *s, char (*f)(unsigned int, char))
{
	size_t	i;
	size_t	len;
	char	*rtn;

	if (!s)
		return (0);
	i = 0;
	len = ft_strlen(s);
	rtn = (char *)malloc(len * sizeof(char) + 1);
	if (!rtn)
		return (0);
	while (i < len)
	{
		rtn[i] = (*f)(i, s[i]);
		i++;
	}
	rtn[i] = '\0';
	return (rtn);
}
````
- #### striteri
	Applies the function ’f’ on each character of the string passed as argument, passing its index   as first argument. Each character is passed by address to ’f’ to be modified if necessary.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

void	ft_striteri(char *s, void (*f)(unsigned int, char *))
{
	size_t	i;

	if (!s)
		return ;
	i = 0;
	while (s[i])
	{
		(*f)(i, &s[i]);
		i++;
	}
}
````
- #### putchar_fd
	Outputs the character ’c’ to the given file descriptor.
	```` ad-note
	What is a file descriptor? File descriptor is a unsigned integer used by a process to identif an open file. In C, 0 is standard input, 1 is standard output, 2 is standard error. Every new file descriptor that is opened will take the next number that is free. For an example:
	~~~c
	unsigned int fd;
	fd = open(xd.txt, O_RDWR);
	//xd.txt is assigned into 3 so fd = 3
	printf("%d", fd);
	//this will print 3
	~~~
	Write functions first parameter is always file descriptor. write(1,*,*); means it will write a output to terminal because 1 is standard output by default.
	~~~c
	write(1,"xd",2);
	//first function will write xd on the terminal
	write(fd,"xd",42);
	//second one will write xd into the xd.txt file
	~~~
	````

``` ad-example
title: Code
collapse: close
~~~

#include "libft.h"

void	ft_putchar_fd(char c, int fd)
{
	write(fd, &c, 1);
}
````
- #### putstr_fd
	Outputs the string ’s’ to the given file descriptor.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

void	ft_putstr_fd(char *s, int fd)
{
	size_t	i;

	i = 0;
	if (!s)
		return ;
	while (s[i])
	{
		ft_putchar_fd(s[i], fd);
		i++;
	}
}
````
- #### putendl_fd
	Outputs the string ’s’ to the given file descriptor followed by a newline.
``` ad-example
title: Code
collapse: close
~~~c
void	ft_putendl_fd(char *s, int fd)
{
	ft_putstr_fd(s, fd);
	ft_putchar_fd('\n', fd);
}
````
- #### putnbr_fd
	Outputs the integer ’n’ to the given file descriptor.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

void	ft_putnbr_fd(int n, int fd)
{
	if (n == -2147483648)
	{
		ft_putchar_fd('-', fd);
		ft_putchar_fd('2', fd);
		ft_putnbr_fd(147483648, fd);
	}
	else if (n < 0)
	{
		ft_putchar_fd('-', fd);
		n = n * (-1);
		ft_putnbr_fd(n, fd);
	}
	else if (n > 9)
	{
		ft_putnbr_fd(n / 10, fd);
		ft_putchar_fd(n % 10 + '0', fd);
	}
	else if (n < 10)
	{
		ft_putchar_fd(n + '0', fd);
	}
}
````
- - -
## Bonus Part
```` ad-note
What is a struct? A struct is a collection of variables (can be different types) under a single name.

First of all lets look at the syntax of a struct:
~~~c
struct structureName {
	dataType member1;
	dataType member2;
	...
};

//For an example
struct 42Student {
	char *name;
	int cardno;
	int intralevel;
	char *intraid;
};
~~~
When a truct type is declared, no storage or memory is allocated. To allacote memory of a given structure type and work with it, we need to create variables.

~~~c
struct 42Student person1;
~~~
person1 is a struct 42Student variable.

#### Access Members of a Structure:
There are two types of operators used for accessing members of a structure.
1. `.` -Member operator
2. `->` -Structure pointer operator

For an example you want to access person1's intraid. Here's how you can do it.
```c
person1.intraid
```
#### Typedef
We use `typedef` keyword to create an alias for data types.

For example:
```c
typedef struct 42Student {
	char *name;
	int cardno;
	int intralevel;
	char *intraid;
} std;

int main() {
	//we can just use std instead of struct 42Student
	std studen1;
}
```
#### Linked List

Because we can add any type of variable in a struct we can also add pointer to another struct. We can link structs to eachother. For example:

~~~c
typedef struct 42Student {
	char *intraid;
	std *nextstudent;
} std;

int main() {
	//we can just use std instead of struct 42Student
	std *student1;
	std *student2;
	//if the variable is a struct pointer we use '->' instead of '.'
	ft_strlcpy(student1->intraid, "acerrah", 7);
	ft_strlcpy(student2->intraid, "hozdemir", 8);
	student1->nextstudent = student2;
	student2->nextstudent = NULL;
	// by making these structs we made a link list
	
	// student1--------------->student2
	// -student1.intraid       -student2.intraid
	
	// we can go same way with the arrow but we can't come back because we will lost the address of studen1 the moment we change as student1 = student1->next; so instead we generally make a temporary variable to hold next values
}
~~~
````

``` ad-important
Struct members are stored in the order they are declared.
If necessary, padding is added betwen struct members to ensure that the latter one uses the correct alignment.
Each primitive type T requires an alignmet of sizeof(T) bytes.

For example:
~~~c
struct ST
{
   char ch1;     // 1 + 1
   short s;      // 2
   char ch2;     // 1 + 3
   long long ll; // 8
   int i;        // 4 + 4
};
//24 bytes in total with padding
struct ST
{
   long long ll; //  8
   int i;        //  4
   short s;      //  2
   char ch1;     //  1
   char ch2;     //  1
} ST;
// 16 bytes in total without padding
~~~
```
- #### lst_new
	Lst_new  is a function that creates a new struct with its content as the parameter. Then it returns the new struct pointer.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

t_list	*ft_lstnew(void *content)
{
	t_list	*node;

	node = malloc(sizeof(t_list));
	if (!node)
		return (0);
	node->content = content;
	node->next = NULL;
	return (node);
}
````
- #### lstadd_front
	lstadd_front adds a new struct to the front of a linked list. New structs next will be the first element of the linked list.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

void	ft_lstadd_front(t_list **lst, t_list *new)
{
	new->next = (*lst);
	(*lst) = new;
}
````
- #### lstsize
	Lstsize counts how many elements in the linked list.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

int	ft_lstsize(t_list *lst)
{
	t_list	*iter;
	int		i;

	iter = lst;
	i = 0;
	while (iter != NULL)
	{
		i++;
		iter = iter->next;
	}
	return (i);
}
````
- #### lstlast
	Lstlast goes to the last element of the linked list and returns it.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

t_list	*ft_lstlast(t_list *lst)
{
	if (!lst)
		return (NULL);
	while (lst->next != NULL)
	{
		lst = lst->next;
	}
	return (lst);
}
````
- #### lstadd_back
	Lstadd_back uses lstlast to go to last element of the linked list then adds a new struct to the end by changing the  last element's next to new's address.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

void	ft_lstadd_back(t_list **lst, t_list *new)
{
	if (!new || !lst)
		return ;
	if (!*lst)
	{
		(*lst) = new;
	}
	else
	{
		(ft_lstlast(*lst))->next = new;
		(ft_lstlast(*lst))->next = NULL;
	}
}
````
- #### lstdelone
	Lstdelone deletes an element from the linked list.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

void	ft_lstdelone(t_list *lst, void (*del)(void*))
{
	if (!lst || !del)
		return ;
	(*del)(lst->content);
	free(lst);
}
````
- #### lstclear
	Lstclear deletes all the elements of the list.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

void	ft_lstclear(t_list **lst, void (*del)(void*))
{
	t_list	*cnext;

	if (!lst || !del || !*lst)
		return ;
	cnext = (*lst);
	while (cnext != (NULL))
	{
		cnext = (*lst)->next;
		(*del)((*lst)->content);
		free(*lst);
		(*lst) = cnext;
	}
}
````
- #### lstiter
	Lstiter applies 'f' function to every content of the linked list's elements.
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

void	ft_lstiter(t_list *lst, void (*f)(void *))
{
	if (!lst || !f)
		return ;
	while (lst != NULL)
	{
		(*f)(lst->content);
		lst = lst->next;
	}
}
````
- #### lstmap
	Lstmap makes a new linked list with 'f' function applied to every element of the given linked list. If the f function doesn't work anywhere in the lstmap it frees all the new list and returns NULL. 
``` ad-example
title: Code
collapse: close
~~~c
#include "libft.h"

t_list	*ft_lstmap(t_list *lst, void *(*f)(void *), void (*del)(void *))
{
	t_list	*nback;
	void	*data;

	nback = NULL;
	if (!lst || !f | !del)
		return (nback);
	while (lst != NULL)
	{
		data = (*f)(lst->content);
		if (!data)
		{
			del(data);
			ft_lstdelone(nback, del);
			return (NULL);
		}
		ft_lstadd_back(&nback, ft_lstnew(data));
		lst = lst->next;
	}
	return (nback);
}
````
- - -
## Sources
github.com/acerrah
www.tutorialspoint.com
