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

## 1.3 

リストだよ

1つのリストには同じ型の要素しか入らないので注意！

``` haskell
let numArr = [1,2,3] -- 宣言はこんなかんじ

[1,2,3] ++ [4,5,6] -- [1,2,3,4,5,6] 
-- ++ なのに注意 + じゃないよ
[1,2,3] ++ [1,2,3] -- [1,2,3,1,2,3]
```

連結操作はおもに ++ 演算子が使われるっぽい

``` haskell
"hello" ++ " " ++ "world" -- "hello world"

['u','n'] ++ ['k','o'] -- "unko"
```

文字列は文字のリストになってるみたい

**++ はリストを最後まで見るのでそこは気をつけて**

リストの先頭に何か要素を追加するのは軽い処理らしいぞ
そのときには : 演算子を使う (なんて呼べばいいんだ ( cons演算子だって

``` haskell
5:[1,2,3,4,5] -- [5,1,2,3,4,5]
--もちろん文字列もいける
'u': "nko" -- "unko"
```

これは面白い話なんですが、
``` haskell 
 [1,2,3] 
 ```
は
``` haskell 
1:2:3:[]
```
の、シュガーシンタックスっぽい

リストへのアクセス
``` haskell
"unko" !! 2 --k 
```

リストの中のリストを作る時、気をつけないといけないのが、```1つのリストには同じ型の要素しか入らないので注意！```ってやつ

リストが入るリストとしてリストを作らないといけない (ゲシュタルト

``` haskell
let b = [[1,2,3],[1,2],[3,2,1]]

b ++ [[1,1,1]] -- [[1,2,3],[1,2],[3,2,1],[1,1,1]]

[123,321] : b -- [[123,321],[1,2,3],[1,2],[3,2,1]]
```
もちろん b:b は怒られる
```
<interactive>:28:1: error:
    • Non type-variable argument in the constraint: Num [a]
      (Use FlexibleContexts to permit this)
    • When checking the inferred type
        it :: forall a. (Num a, Num [a]) => [[[a]]]
```

リストの比較何ですがこれを見て欲しくて、
```haskell
*Main Lib> [1,4]>[2,3]
False
*Main Lib> [1,1]>[2,3]
False
*Main Lib> [1,4] > [2,3]
False
*Main Lib> [2,4] > [2,3]
True
*Main Lib> [2,3] > [2,3]
False
```

```[1,2] < [1,3]```だったとして、

- 1と1が同じ値なので次が参照される
- 2 < 3 となって trueが帰ってくる

また

``` haskell 
[1,2,3] > [1,2] -- True
```
ない奴よりある奴が大きくなるみたい

***この辺でそのうち詰まりそう***

ほかにも``` head , tail , last , init ```関数があるよ

``` haskell 
*Main Lib> head [1,2,3]
1
*Main Lib> tail [1,2,3]
[2,3]
*Main Lib> last [1,2,3]
3
*Main Lib> init [1,2,3]
[1,2]
```

- length は配列の長さを返す ( いつもの
- null関数って奴がある
``` haskell 
null [1,2] -- False

null [] -- True
```
- reverse 関数はリストを逆順に 
- take関数  第一位引数がリストよりでかいとリスト全部帰ってくる
``` haskell 
take 2 [1,2,3,4] -- [1,2]
take 0 [1] -- [] それはそう
```
- dropなるやつ , お気持ちtakeの逆みたいな感じ
``` haskell 
drop 2 [1,2,3,4] -- [3,4]
drop 999 [1,2,3,4] -- []
```
- maximum , minimum いつもの
- sum いつもの
- product , 配列の積を返す
``` haskell 
product [1,2,3] -- 6
```
- elem 関数 , なんか中間関数としてつかわれがちらしい
``` haskell 
*Main Lib> elem 1 [1,2,3,4]
True
*Main Lib> elem 5 [1,2,3,4]
False
```