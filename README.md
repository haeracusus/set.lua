# set.lua
Basic Set implementation
*P.S: Sets are fancy tables. Functions in set.lua may be used on tables, however they won't work properly. (except for cardinality, that one can get the full length of a table (even on numbered tables!))*

HAVE YOU EVER WANTED TO MAKE A SET IN LUA????
IF THE ANSWER TO THAT QUESTION IS YES *(but i want it to be primitive.)*,
THEN I HAVE GOT JUST THE THING FOR YOU!!!

INTRODUCING MY **NEW** LUA MODULE:

# set.lua (did we already say that?)

ABSOLUTELY **NO** METATABLES INVOLVED!!! *(up to you whether that's a good thing or not)*

# Usage

Require the Set module:
```lua
local set = require 'set'
```

To make a new Set, use the function `set.new`
```lua
local awesome = set.new({1,2,3})
```
Sets support any data type, however for the usage examples we will use numbers.

## now how do i use the new set

Simple! To check for an object in the set, simply do:
```lua
local awesome = set.new({1,2,3})
local obj = 1
if awesome[obj] then
  print('They have it!')
  --output: They have it!
end
```

## is that it

No.

### Adding & removing from a set

Adding:
```lua
local awesomeSet = set.new({1,2,3,4,5,6,7,8,9,10,12})
--11 is missing, we need to add

set.add(awesomeSet,11)
--awesomeSet = 1,2,3,4,5,6,7,8,9,10,11,12
```
Removing:
```lua
local awesomeSet = set.new({1,2,3,4,5,6,7,8,9,10,12})
--11 is missing, we need to REMOVE 12!!!!

set.remove(awesomeSet,12)
--awesomeSet = 1,2,3,4,5,6,7,8,9,10
```

### Set concatenation

Printing a Set's contents
```lua
local awesomeSet = set.new({1,2,3,4,5,6,7,8,9,10,11,12})

print(set.concat(awesomeSet,'\n'))
```

output:

```
1
2
3
4
5
6
7
8
9
10
11
12
```

### Getting Set Length/Cardinality

```lua
local awesomeSet = set.new({1,2,3,4,5,6,7,8,9,10})

print(set.cardinality(awesomeSet))
```

output:

```
10
```

### Set Unions

To add two Sets together, use the set.union function!


```lua
local A = set.new({1,2,3})
local B = set.new({3,4,5})

local union = set.union(A,B)
--intersection = 1,2,3,4,5
```

### Set Intersections

The Intersection of two Sets are the values that they **both** share.

```lua
local A = set.new({1,2,3})
local B = set.new({3,4,5})

local intersection = set.intersection(A,B)
--intersection = 3
```

### Set Difference 

The Difference of two Sets are the values the first Set does not share with the second.

```lua
local A = set.new({1,2,3})
local B = set.new({3,4,5})

local diff = set.diff(A,B)
--diff = 1,2
```

### Set Symmetrical Difference

The Symetrical Difference of two Sets are the values they both have, but do not share.

```lua
local A = set.new({1,2,3})
local B = set.new({3,4,5})

local sdiff = set.sdiff(A,B)
--sdiff = 1,2,4,5
```
