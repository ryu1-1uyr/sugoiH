### 1.0

負の数が出てくるときはカッコを使うといいよ

``` Haskell
(-1) * 30
```
これだと - あたりで文句をいってくる
``` Haskell
30 * -1
```

!= が/= だよ
``` Haskell
5 /= 5 // False
5 == 5 // True
5 /= 4 // True
```
もちろん型違いの足し算は怒るよそれはそうだね

### 1.1

ここまでで関数を使っています　な、なんだってー

``` * は 2つの引数をとり、それらを掛け合わせる関数```
あーねなるほど完全に理解した。

``` + - * / ```とかを **中間関数**っていうんだって
Haskellではどっちかというと**前置関数**をよくみる

succ関数、とてつもなく退屈な関数らしい　筆者が言ってた　
そんなことないよ…succ元気出して…

```` Haskell
succ 1 -- 2
````
ちなみにコメントアウトは``` --``` でいいみたい

``` Haskell
succ succ 1
```
ってかいたらおこられた
```
<interactive>:8:1: error:
    • Non type-variable argument in the constraint: Enum (a -> a)
      (Use FlexibleContexts to permit this)
    • When checking the inferred type
        it :: forall a. (Enum a, Enum (a -> a), Num a) => a
```
これならいいらしい
``` Haskell
succ (succ 1) -- 3
```
なんとなくださいわね…
そのうちよくかけるようになるだろ（適当


``` Haskell
min 9 10 -- 9
min 3.1 3.2 --3.1
```
あれ小数点で型はかわらないのか？

``` Haskell
succ 9 * 10 -- 100
succ (9 * 10) -- 91
```
この辺の実行順序気をつけようね

divは整数の除算をする関数です
``` Haskell
div 92 10 -- 9
```

``` Haskell
92 `div` 10 -- 9
```
``` ` ```をつかえば中間関数にすることもできるよ


