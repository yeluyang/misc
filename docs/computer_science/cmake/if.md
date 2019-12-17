# CMake if语句

[TOC]

## 基本语法

```CMake
if (expression_1)
    IF_CMAKE_COMMAND
    ...
elseif (expression_2)
    ELSEIF_CMAKE_COMMAND
    ...
else (expression_1)
    ELSE_CMAKE_COMMAND
    ...
endif (expression_1)
```

一个`if语句块`由`if, elseif, else`组成，并且由`endif`结尾，这是因为`CMake`没有缩进或者花括号之类的符号来标识语句块，如果没有`endif`会导致下文的其它命令也被当作`if语句块`的内部命令之一

另外，只有`if`和`endif`是必须的，其他的`elseif`和`else`都是可选的

执行顺序如下：

- 先判断`if`
  - 若真，执行`IF_CMAKE_COMMAND`
  - 若假，则判断接下来的`elseif`
    - 若真，执行`ELSEIF_CMAKE_COMMAND`
    - 若假，继续判断接下来的`elseif`
- 无论是`if`还是`elseif`，若判断为假且接下来没有其他的`elseif`的话，则执行`else`的`ELSE_CMAKE_COMMAND`

## 条件表达式

条件表达式可以由单个变量或单变量与单目逻辑谓语组成，也可以由逻辑连词或多目逻辑谓语组织多个变量或表达式复合组成

### 变量值与布尔值的转换

当条件表达式由单个变量组成时，变量转换成布尔值时的取值决定了条件表达式的值。变量值与布尔值的转换规则如下：

变量`var`取以下值之一时，其布尔值为`假`，否则为`真`

```text
var =   ,（为空）
        0,
        N,
        NO,
        OFF,
        FALSE,
        NOTFOUND,
        <var>_NOTFOUND,
```

### 逻辑连词

- AND: if (var_1 AND var_2)，两个变量布尔值都取真时表达式为真，否则为假
- OR: if (var_1 OR var_2)，存在一个变量布尔值取真时表达式为真，否则为假

### 逻辑谓语

- NOT: if (NOT var)，对`var`的布尔值取反并返回
- DEFINED: if (DEFINED var)，变量`var`被定义时返回真，否则返回假
- COMMAND: if (COMMAND cmd)，当`cmd`是系统命令并且可调用是返回真，否则返回假
- EXISTS: if (EXISTS file)，当`file`是文件或目录且存在时返回真，否则返回假
- IS_DIRECTORY: if (IS_DIRECTORY dir)，当`dir`是目录且存在时返回真，否则返回假
- IS_NEWER_THAN:
  - if (file_1 IS_NEWER_THAN file_2), `file_1`比`file_2`更新时返回真，否则为假。  
  - 注意：当`file_1`或者`file_2`其中至多一个不存在时，返回真

### 比较运算

`比较运算逻辑`也是属于`逻辑谓语`，但其内容较多，单列出来讲讲

1. 数字比较：
    - LESS: if (var_1 LESS var_2)，`var_1`小于`var_2`时返回真，否则返回假
    - GREATER: if (var_1 GREATER var_2)，`var_1`大于`var_2`时返回真，否则返回假
    - EQUAL: if (var_1 EQUAL var_2)，`var_1`等于`var_2`时返回真，否则返回假
1. 字符串比较（按字典序）：
    - STRLESS: if (str_1 STRLESS str_2)，`str_1`小于`str_2`时返回真，否则返回假
    - STRGREATER: if (str_1 STRGREATER str_2)，`str_1`大于`str_2`时返回真，否则返回假
    - STREQUAL: if (str_1 STREQUAL str_2)，`str_1`等于`str_2`时返回真，否则返回假

## 条件表达式的省略

`CMake`的内置变量`CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCTS`控制着`if语句`的书写方式，当`CMakeLists.txt`包含如下语句时：

```CMake
set (CMAKE_ALLOW_LOOSE_LOOP_CONSTRUCTS ON)
```

`if语句`中的`else`和`endif`语句可以省略条件表达式，但括号仍要保留，如下：

```CMake
if (expression_1)
    ...
elseif (expression_2)
    ...
else ()
    ...
endif ()
```