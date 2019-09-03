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


## 1.2

関数定義は関数呼び出しに似ているよ　ちょっとだけね

``` Haskell
doubleMe x = x + x

doubleMe 9 -- 18
```
Haskellでよくあるらしいのが、```明らかに正しい関数を組み合わせて、より大きな関数を組み立てる```というのがよくあるんだって

一例として、
``` Haskell
doubleUs x y = x * 2 + y * 2
```
という関数を定義するとして、
``` Haskell
doubleUs x y = doubleMe x + doubleMe y
```
このように書ける（それはそう
世界が再定義されても対応が簡単らしいなるほど

<small>
> 感想、小言 <br>
関数内から自分が定義した関数を呼び出すなどの、関数内での関数呼び出しは密結合ちっくになると思って避けてたんだけど、自明な関数なら別に問題にはならないっぽい？
そのための強力な型制約とかな気がしてきた
</small>

さてみんな大好きif式だよ！！

``` Haskell
doubleSmallNumber x = if x > 100
					  then x
					  else x * 2
```
こんな感じで関数が定義できます
Haskell独特なのはif式を使った際に、else節が必須なこと

ifもちゃんと関数なので値を返さないといけない！！

既存の関数v2を作る場合```'```が有効

``` Haskell
doubleSmallNumber' x = (if x > 100 then x else x * 2) + 1
```
- 'が関数に使える。
- 関数の頭は大文字を使えない

この辺が大事ぽい
