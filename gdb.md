# gdb

- [gdb in 60 seconds](https://www.youtube.com/watch?v=mfmXcbiRs0E)  
- [great tui talk, 15 min](https://www.youtube.com/watch?v=PorfLSr3DDI)  
- [gdb basics](https://www.youtube.com/watch?v=sCtY--xRUyI)  
- https://niranjanmr.wordpress.com/2013/04/28/using-gdb-layout-when-debugging-assembly-language-programs/    
- https://sourceware.org/gdb/onlinedocs/gdb/TUI.html  

C-x a - switch between normal and tui mode  
Can use Emacs commands to swicth windows and stuff  

## Basic Commands

**r** - run  
**n** - next  
**s** - step  
**c** - continue  
**k** - kill  

## Breakpoints

**b** - break  
**d** - delete  

## Vars

**p** - print  
**w** - watch  
**info locals**  
**info args**  

## Layouts

**lay regs** - view registers  
**lay next/prev** - cycle layouts  
**list** - print source code to window  

## Examine Memory

Use **x** and one of the options below to examine memory. Can specify
specific address, such as: *0x8048384* or can analyze register ith a
dollar sign: *$eip*  

**o** - Display in octal  
**x** - Display in hex  
**u** - Diplay in unsigned, standard base 10  
**t** - Display in binary  

Can also specify number of addressed to show and sizes, sizes are
confusing, but as such:  

**b** - A single byte  
**h** - A halfword, 2 bytes  
**w** - A word, 4 bytes  
**g** - A giant, 8 bytes  

Example:
```Bash
(gdb) i r eip
eip    0x8048384    0x8048384 <main+16>
(gdb) x/u $eip
0x8048384 <main+16>:    16532935
(gdb) x/t 0x8048384
0x8048384 <main+16>:    00000000111111000100010111000111
(gdb) x/8xb $eip
0x8048384 <main+16>:    0xc7 0x45 0xf4 0x00 0x00 0x00 0x00 0x83
```

> Note how the single bytes are stored in little-endian style

Can also use examine on instruction using **x/i**, fo example:

```Bash
(gdb) x/3i $eip
0x8048384 <main+16>:    mov DWORD PTR [ebp-4],0x0
0x804838b <main+23>:    cmp DWORD PTR [ebp-4],0x9
0x804838f <main+27>:    jle 0x8048393 <main+31>
```
