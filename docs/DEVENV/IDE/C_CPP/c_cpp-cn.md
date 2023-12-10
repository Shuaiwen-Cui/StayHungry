-> [English](/DEVENV/IDE/C_CPP/c_cpp.md)

# C/C++
## IDE / 编辑器
- VSCode
  - PlatformIO
- Visual Studio
- Keil
- Eclipse
- IntelliJ IDEA

## 构建系统
> 从 gcc 到 cmake

[🔗 GCC、CMake、CMakelist、Make、Makefile、Ninja啥关系？一图讲透！](https://zhuanlan.zhihu.com/p/659841728)

- gcc
  - gcc 是一个编译器
- make & makefile
  - make 是一个构建系统，用于构建项目。make 构建在 gcc 之上。makefile 是 make 的配置文件。
- cmake & CMakeLists.txt
  - cmake 是一个构建系统，用于构建项目。cmake 构建在 make 之上。CMakeLists.txt 是 cmake 的配置文件。
- ninja
  - ninja 是一个构建系统，用于构建项目。ninja 构建在 cmake 之上。ninja 是 cmake 的替代品，因为 ninja 构建速度更快。
- xmake
  - xmake 是一个构建系统，用于构建项目。xmake 的特点是简单易用，且跨平台。xmake 构建在 ninja 之上。xmake 是 ninja 的替代品，因为 xmake 更简单易用。注意，xmake起步晚，尚未经过大规模验证，因此在大型项目中使用时需要谨慎。

### GCC

** KEY COMMANDS TO REMEMBER **

> 简单用法

```bash
gcc <srcfilename>.c

// then run

./a.out

```

> 正常用法


```bash
gcc <srcfilename>.c -o <exefile>.o

// then run

./<exefile>.o

```

or
    
```bash

gcc <srcfilename>.c -o <exefile>.exe // for windows

// then run

./<exefile>.exe

```



该部分转自以下链接：
[🔗 GCC基本使用](https://zhuanlan.zhihu.com/p/404682058)

---------------------------------- I GCC 工具 ----------------------------------

> GCC 编译器

GCC（GNU Compiler Collection）是由 GNU 开发的编程语言编译器。 GCC最初代表“GNU C Compiler”，当时只支持C语言。 后来又扩展能够支持更多编程语言，包括 C++、Fortran 和 Java 等。 因此，GCC也被重新定义为“GNU Compiler Collection”，成为历史上最优秀的编译器， 其执行效率与一般的编译器相比平均效率要高 20%~30%。

> GCC 编译工具链

GCC编译工具链（toolchain），是指以GCC编译器为核心的一整套工具。它主要包含以下三部分内容：

- gcc-core：即GCC编译器，用于完成预处理和编译过程，把C代码转换成汇编代码。
- Binutils ：除GCC编译器外的一系列小工具包括了链接器ld，汇编器as、目标文件格式查看器readelf等。
- glibc：包含了主要的 C语言标准函数库，C语言中常常使用的打印函数printf、malloc函数就在glibc 库中。
在很多场合下会直接用GCC编译器来指代整套GCC编译工具链。

> Binutils工具集

Binutils（bin utility），是GNU二进制工具集，通常跟GCC编译器一起打包安装到系统，它的官方说明网站地址为： https://www.gnu.org/software/binutils/ 。

在进行程序开发的时候通常不会直接调用这些工具，而是在使用GCC编译指令的时候由GCC编译器间接调用。下面是其中一些常用的工具：

- as：汇编器，把汇编语言代码转换为机器码（目标文件）。
- ld：链接器，把编译生成的多个目标文件组织成最终的可执行程序文件。
- readelf：可用于查看目标文件或可执行程序文件的信息。
- nm ： 可用于查看目标文件中出现的符号。
- objcopy： 可用于目标文件格式转换，如.bin 转换成 .elf 、.elf 转换成 .bin等。
- objdump：可用于查看目标文件的信息，最主要的作用是反汇编。
- size：可用于查看目标文件不同部分的尺寸和总尺寸，例如代码段大小、数据段大小、使用的静态内存、总大小等。

> glibc库

glibc库是GNU组织为GNU系统以及Linux系统编写的C语言标准库，因为绝大部分C程序都依赖该函数库，该文件甚至会直接影响到系统的正常运行，例如常用的文件操作函数read、write、open，打印函数printf、动态内存申请函数malloc等。

---------------------------------- II GCC 编译 ----------------------------------

> GCC 编译过程

GCC 编译工具链在编译一个C源文件时需要经过以下 4 步：

- 预处理：为把头文件的代码、宏之类的内容转换成生成的.i文件，还是C代码。
- 编译：把预处理后的.i文件通过编译成.s文件，汇编语言。
- 汇编：将汇编语言文件生成目标文件.o文件，机器码。
- 链接：将每个源文件对应的.o文件链接起来，就生成一个可执行程序文件。

![COMPILE-PROCESS](COMPLIE-PROCESS.jpg ':size=50%')

> (1) 预处理

预处理过程中，对源代码文件中的文件包含 (include)、 预编译语句 (如宏定义define等)进行展开，生成 .i 文件。 可理解为把头文件的代码、宏之类的内容转换成更纯粹的C代码，不过生成的文件以.i为后缀。

使用GCC的参数 “-E”，可以让编译器生成 .i 文件，参数 “-o”，可以指定输出文件的名字。

```bash
# 预处理，可理解为把头文件的代码汇总成C代码，把*.c转换得到*.i文件
gcc -E hello.c -o hello.i
```

相当于它把原C代码中包含的头文件中引用的内容汇总到一处， 如果原C代码有宏定义，它把宏定义展开成具体的内容。

> (2) 编译

把预处理后的.i文件通过编译成为汇编语言，生成.s文件，即把代码从C语言转换成汇编语言，这是GCC编译器完成的工作。在这个过程，GCC会检查各个源文件的语法，即使我们调用了一个没有定义的函数，也不会报错。

GCC可以使用-S选项，让编译程序生成汇编语言的代码文件（.s后缀）。

```bash
# 编译，可理解为把C代码转换为汇编代码，把*.i转换得到*.s文件
gcc –S hello.i –o hello.s
​
# 也可以直接以C文件作为输入进行编译，与上面的命令是等价的
gcc –S hello.c –o hello.s
```

> (3) 汇编

将汇编语言文件经过汇编，生成目标文件.o文件，每一个源文件都对应一个目标文件。即把汇编语言的代码转换成机器码，这是as汇编器完成的工作。

GCC的参数“c”表示只编译(compile)源文件但不链接，会将源程序编译成目标文件（.o后缀）。计算机只认识0或者1，不懂得C语言，也不懂得汇编语言，经过编译汇编之后，生成的目标文件包含着机器代码，这部分代码就可以直接被计算机执行。一般情况下，可以直接使用参数“c”，跳过上述的两个过程，具体命令 如下：

```bash
# 汇编，可理解为把汇编代码转换为机器码，把*.s转换得到*.o，即目标文件
gcc –c hello.s –o hello.o
​
# 也可以直接以C文件作为输入进行汇编，与上面的命令是等价的
gcc –c hello.c –o hello.o
```

Linux下生成的 *.o目标文件、*so动态库文件以及下一小节链接阶段生成最终的可执行文件都是elf格式的， 可以使用“readelf”工具来查看它们的内容。

从 readelf 的工具输出的信息，可以了解到目标文件包含ELF头、程序头、节等内容， 对于*.o目标文件或*.so库文件，编译器在链接阶段利用这些信息把多个文件组织起来， 对于可执行文件，系统在运行时根据这些信息加载程序运行。

> (4) 链接

最后将每个源文件对应的目标.o文件链接起来，就生成一个可执行程序文件，这是链接器ld完成的工作。

例如一个工程里包含了A和B两个代码文件，在链接阶段， 链接过程需要把A和B之间的函数调用关系理顺，也就是说要告诉A在哪里能够调用到fun函数， 建立映射关系，所以称之为链接。若链接过程中找不到fun函数的具体定义，则会链接报错。

虽然本示例只有一个hello.c文件，但它调用了C标准代码库的printf函数， 所以链接器会把它和printf函数链接起来，生成最终的可执行文件。

链接分为两种：

- 动态链接：GCC编译时的默认选项。动态是指在应用程序运行时才去加载外部的代码库，不同的程序可以共用代码库。 所以动态链接生成的程序比较小，占用较少的内存。

- 静态链接：链接时使用选项 “--static”，它在编译阶段就会把所有用到的库打包到自己的可执行程序中。 所以静态链接的优点是具有较好的兼容性，不依赖外部环境，但是生成的程序比较大。
执行如下命令体验静态链接与动态链接的区别：

```bash
# 在hello.o所在的目录执行如下命令
# 动态链接，生成名为hello的可执行文件
​
gcc hello.o –o hello
​
# 也可以直接使用C文件一步生成，与上面的命令等价
gcc hello.c -o hello
​
# 静态链接，使用--static参数，生成名为hello_static的可执行文件
gcc hello.o –o hello_static --static
​
# 也可以直接使用C文件一步生成，与上面的命令等价
gcc hello.c -o hello_static --static
```

---------------------------------- III 交叉编译 ----------------------------------

如果我们希望编译器运行在x86架构平台上，然后编译生成ARM架构的可执行程序，这种编译器和目标程序运行在不同架构的编译过程，被称为 交叉编译。

> （1）安装ARM-GCC

```bash
# 在主机上执行如下命令
sudo apt install gcc-arm-linux-gnueabihf
​
# 安装完成后使用如下命令查看版本
arm-linux-gnueabihf-gcc –v
```

> （2）交叉编译

交叉编译器与本地编译器使用起来并没有多大区别。

```bash
# 在hello.c程序所在的目录执行如下命令
arm-linux-gnueabihf-gcc hello.c –o hello_arm
```

同样的C代码文件，使用交叉编译器编译后，生成的hello已经变成了ARM平台的可执行文件，可以通过readelf工具来查看具体的程序信息。

readelf工具在系统安装GCC编译工具链时一起被安装了，我们可以直接使用。在主机上执行以下命令：

```bash
# 以下命令在主机上运行
readelf -a hello_arm
```

最后把hello_arm通过NFS拷贝到开发板上，就能手动运行了。

> （3）GCC编译器命名格式

除了我们安装的arm-linux-gnueabihf-gcc外，编译器还有很多版本，如arm-linux-gnueabi-gcc，本地编译器gcc全名为x86_64-linux-gnu-gcc，这些编译器是有一定的命名规则的：

arch [-os] [-(gnu)eabi(hf)] -gcc

其中的各字段如下表所示：

![CROSS-COMPILER](CROSS-COMPILER.jpg ':size=50%')

以我们安装的arm-linux-gnueabihf-gcc编译器为例：

- arm：表示它的目标芯片架构为ARM
- linux：目标操作系统为Linux
- gnu：使用GNU的C标准库即glibc
- eabi：使用嵌入式应用二进制接口（eabi）
- hf：编译器的浮点模式为硬浮点hard-float

### G++

与GCC类似，G++是GCC的C++编译器，它的编译过程与GCC类似，只是在编译阶段会调用C++的编译器g++，在链接阶段会调用C++的链接器g++。

```bash
# 使用 g++ 编译 C++ 代码示例

## 1. 编译单个源文件：

g++ source.cpp -o output

## 2. 编译多个源文件：

g++ source1.cpp source2.cpp -o output

## 3. 指定C++标准：

g++ -std=c++11 source.cpp -o output

## 4.添加调试信息

g++ -g source.cpp -o output

## 5.指定输出目录

g++ source.cpp -o build/output

## 6.链接外部库

g++ source.cpp -o output -llibrary

## 7.指定头文件目录

g++ -I/path/to/headers source.cpp -o output

## 8.显示编译过程详细信息

g++ -v source.cpp -o output

```


### Clang

待更新

### Make & Makefile

以下部分转自以下链接：
[🔗 Makefile入门(超详细一文读懂)](https://zhuanlan.zhihu.com/p/575852387)

> 1 Makefile编译过程

![MAKE-PROCESS](MAKE-PROCESS.jpg ':size=50%')

Makefile文件中的命令有一定规范，一旦该文件编写好以后在Linux命令行中执行一条make命令即可自动编译整个工程。不同厂家的make可能会稍有不同，并且语法上也有区别，不过基本思想都差不多，主要还是落在目标依赖上，最广泛使用的是GNUmake。

> 2 语法规则

```bash
目标 ... : 依赖 ...
	命令1
	命令2
	. . .

```

Makefile的核心规则，类似于一位厨神做菜，目标就是做好一道菜，那么所谓的依赖就是各种食材，各种厨具等等，然后需要厨师好的技术方法类似于命令，才能作出一道好菜。

同时这些依赖也有可能此时并不存在，需要现场制作，或者是由其他厨师做好，那么这个依赖就成为了其他规则的目标，该目标也会有他自己的依赖和命令。这样就形成了一层一层递归依赖组成了Makefile文件。

Makefile并不会关心命令是如何执行的，仅仅只是会去执行所有定义的命令，和我们平时直接输入命令行是一样的效果。

1. 目标即要生成的文件。如果目标文件的更新时间晚于依赖文件更新时间，则说明依赖文件没有改动，目标文件不需要重新编译。否则会进行重新编译并更新目标文件。
2. 默认情况下Makefile的第一个目标为终极目标。
3. 依赖：即目标文件由哪些文件生成。
4. 命令：即通过执行命令由依赖文件生成目标文件。注意每条命令之前必须有一个tab保持缩进，这是语法要求（会有一些编辑工具默认tab为4个空格，会造成Makefile语法错误）。
5. all：Makefile文件默认只生成第一个目标文件即完成编译，但是我们可以通过all 指定所需要生成的目标文件。


> 3 变量

\$符号表示取变量的值，当变量名多于一个字符时，使用"( )"
\$符的其他用法

\$^ 表示所有的依赖文件

\$@ 表示生成的目标文件

\$< 代表第一个依赖文件


```bash
SRC = $(wildcard *.c)
OBJ = $(patsubst %.c, %.o, $(SRC))
 
ALL: hello.out
 
hello.out: $(OBJ)
        gcc $< -o $@
 
$(OBJ): $(SRC)
        gcc -c $< -o $@
        
```

> 4 变量赋值

1、"="是最普通的等号，在Makefile中容易搞错赋值等号，使用 “=”进行赋值，变量的值是整个Makefile中最后被指定的值。

```bash
VIR_A = A
VIR_B = $(VIR_A) B
VIR_A = AA
```

经过上面的赋值后，最后VIR_B的值是AA B，而不是A B，在make时，会把整个Makefile展开，来决定变量的值


2、":=" 表示直接赋值，赋予当前位置的值。

```bash
VIR_A := A
VIR_B := $(VIR_A) B
VIR_A := AA

```

最后BIR_B的值是A B，即根据当前位置进行赋值。因此相当于“=”，“：=”才是真正意义上的直接赋值

3、"?=" 表示如果该变量没有被赋值，赋值予等号后面的值。

```bash
VIR ?= new_value
```
如果VIR在之前没有被赋值，那么VIR的值就为new_value。

```bash
VIR := old_value
VIR ?= new_value
```
这种情况下，VIR的值就是old_value

4、"+="和平时写代码的理解是一样的，表示将符号后面的值添加到前面的变量上

> 5 预定义变量

CC：c编译器的名称，默认值为cc。cpp c预编译器的名称默认值为$(CC) -E

```bash
CC = gcc
```

回显问题，Makefile中的命令都会被打印出来。如果不想打印命令部分 可以使用@去除回显

```bash
@echo "clean done!"
```

> 6 函数

通配符

```bash
SRC = $(wildcard ./*.c)
```
匹配目录下所有.c 文件，并将其赋值给SRC变量。
```bash
OBJ = $(patsubst %.c, %.o, $(SRC))
```
这个函数有三个参数，意思是取出SRC中的所有值，然后将.c 替换为.o 最后赋值给OBJ变量。
示例：如果目录下有很多个.c 源文件，就不需要写很多条规则语句了，而是可以像下面这样写
```bash
SRC = $(wildcard *.c)
OBJ = $(patsubst %.c, %.o, $(SRC))
 
ALL: hello.out
 
hello.out: $(OBJ)
        gcc $(OBJ) -o hello.out
 
$(OBJ): $(SRC)
        gcc -c $(SRC) -o $(OBJ)
```

这里先将所有.c 文件编译为 .o 文件，这样后面更改某个 .c 文件时，其他的 .c 文件将不在编译，而只是编译有更改的 .c 文件，可以大大提高大项目中的编译速度。

> 7 伪目标 .PHONY

伪目标只是一个标签，clean是个伪目标没有依赖文件，只有用make来调用时才会执行

当目录下有与make 命令 同名的文件时 执行make 命令就会出现错误。

解决办法就是使用伪目标
```bash
SRC = $(wildcard *.c)
OBJ = $(patsubst %.c, %.o, $(SRC))
 
ALL: hello.out
 
hello.out: $(OBJ)
        gcc $< -o $@
 
$(OBJ): $(SRC)
        gcc -c $< -o $@
 
clean:
        rm -rf $(OBJ) hello.out
 
.PHONY: clean ALL
```
通常也会把ALL设置成伪目标

> 8 其他常用功能

代码清理clean
我们可以编译一条属于自己的clean语句，来清理make命令所产生的所有文件，列如

```bash
SRC = $(wildcard *.c)
OBJ = $(patsubst %.c, %.o, $(SRC))
 
ALL: hello.out
 
hello.out: $(OBJ)
        gcc $< -o $@
 
$(OBJ): $(SRC)
        gcc -c $< -o $@
 
clean:
        rm -rf $(OBJ) hello.out
```

> 9 嵌套执行Makefile

在一些大工程中，会把不同模块或不同功能的源文件放在不同的目录中，我们可以在每个目录中都写一个该目录的Makefile这有利于让我们的Makefile变的更加简洁，不至于把所有东西全部写在一个Makefile中。

列如在子目录subdir目录下有个Makefile文件，来指明这个目录下文件的编译规则。外部总Makefile可以这样写

```bash
subsystem:
            cd subdir && $(MAKE)
其等价于：
subsystem:
            $(MAKE) -C subdir

```
定义$(MAKE)宏变量的意思是，也许我们的make需要一些参数，所以定义成一个变量比较有利于维护。两个例子意思都是先进入"subdir"目录，然后执行make命令

我们把这个Makefile叫做总控Makefile，总控Makefile的变量可以传递到下级的Makefile中，但是不会覆盖下层Makefile中所定义的变量，除非指定了 "-e"参数。

如果传递变量到下级Makefile中，那么可以使用这样的声明

export

如果不想让某些变量传递到下级Makefile，可以使用

unexport

```bash
export variable = value

等价于

variable = value
export variable

等价于

export variable := value

等价于

variable := value
export variable

如果需要传递所有变量，那么只要一个export就行了。后面什么也不用跟，表示传递所有变量
```

> 10 指定头文件路径

一般都是通过"-I"（大写i）来指定，假设头文件在：

```bash
/home/develop/include
```
则可以通过-I指定：
```bash
-I/home/develop/include
```
将该目录添加到头文件搜索路径中

在Makefile中则可以这样写：
```bash
CFLAGS=-I/home/develop/include
```
然后在编译的时候，引用CFLAGS即可，如下
```bash
yourapp:*.c
    gcc $(CFLAGS) -o yourapp
```

> 11 指定库文件路径

与上面指定头文件类似只不过使用的是"-L"来指定

```bash
LDFLAGS=-L/usr/lib -L/path/to/your/lib
```
告诉链接器要链接哪些库文件，使用"-l"（小写L）如下：

```bash
LIBS = -lpthread -liconv
```

> 12 简单的Makefile实例

![MAKEEXAMPLE](MAKEEXAMPLE.png ':size=50%')

- include
  - myinclude.h

```C
#include <stdio.h>
void print1() ;
void print2() ;

```

- f1
  - f1.c
  - Makefile

```C
#include "../include/myinclude.h"                                                                              

void print1()  
{  
	printf("Message f1.c\n");  
	return;  
} 
```

目标前面的路径，意思是将目标生成到指定的目录下

```bash
../$(OBJS_DIR)/f1.o:f1.c                                                                                       
	@$(CC) -c $^ -o $@  
```

- f2
  - f2.c
  - Makefile

```C
#include "../include/myinclude.h"                                                                              

void print2()  
{  
	printf("Message f2.c\n");  
	return;  
} 
```

目标前面的路径，意思是将目标生成到指定的目录下

```bash
../$(OBJS_DIR)/f2.o:f2.c                                                                                       
	@$(CC) -c $^ -o $@  
```

- main
  - main.c
  - Makefile

```C
#include "../include/myinclude.h"                                                                                            
 
int main(int argc, char const *argv[])
{
    print1();  
	print2();  
    return 0;
}
```

```bash
../$(OBJS_DIR)/main.o:main.c                                                                                   
	@$(CC) -c $^ -o $@  
```

- obj
  - Makefile

this folder is used to store the object files

```bash
../$(BIN_DIR)/$(BIN) : $(OBJS)
	@$(CC) $^ -o $@ 
```

- Makefile （主）

```bash
#预定义变量
CC = gcc
#预定义编译目录
SUBDIRS = f1 \
        f2 \
        main \
        obj
#预定义目标
OBJS = f1.o f2.o main.o
BIN = myapp
OBJS_DIR = obj
BIN_DIR = bin
#传递预定义参数
export CC OBJS BIN OBJS_DIR BIN_DIR

all:CHECK_DIR $(SUBDIRS)
CHECK_DIR:
	@mkdir -p $(BIN_DIR)
$(SUBDIRS):ECHO
	@make -C $@ 

ECHO:
	@echo $(SUBDIRS)
	@echo begin compile
clean:
	@$(RM) $(OBJS_DIR)/*.o
	@rm -rf $(BIN_DIR)
```

- bin (用来存放可执行文件)

### CMake & CMakeLists.txt

### Ninja

### XMake