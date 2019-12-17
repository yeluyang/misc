# CMake 循环语句

[TOC]

## 循环条件表达式

循环对于条件表达式有着与`if语句`相同的条件判断规则：[条件表达式](CMake_if.md#条件表达式)

## while 循环

```CMake
while(expression)
    ...
    COMMAND
    ...
endwhile(expression)
```

## foreach 循环

### 列表循环

```CMake
foreach(var args_1 args_2 ... args_n)
    ...
    COMMAND(use loop variable: var)
    ...
endforeach(var)
```

`args_1 args_2 ... args_n`是传给`foreach`的参数列表，`var`作为循环变量，对参数列表迭代取值

### 范围循环

```CMake
foreach(var RANGE <range/start stop [step]>)
    ...
    COMMAND(use loop variable: var)
    ...
endforeach(var)
```

在`foreach`中使用关键字`RANGE`时，将在指定范围内循环按指定步长循环

`<range/start stop [step]>`: 必须在`range`与`start stop [step]`中选择一个

- range: 一般是数字，循环将从0开始，在`range`结束，注意，循环包括`range`本身
- start stop [step]:
  - `start`指定循环起点，`stop`指定循环终点，注意，循环包括`stop`本身
  - step，步长，可选，缺省值为1