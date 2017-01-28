% 文字列
<!-- % Strings -->

<!-- Strings are an important concept for any programmer to master. Rust’s string -->
<!-- handling system is a bit different from other languages, due to its systems -->
<!-- focus. Any time you have a data structure of variable size, things can get -->
<!-- tricky, and strings are a re-sizable data structure. That being said, Rust’s -->
<!-- strings also work differently than in some other systems languages, such as C. -->
文字列は、プログラマーがマスターすべき重要なコンセプトです。
Rustの文字列の扱いは、Rust言語がシステムにフォーカスしているため、少し他の言語と異なります。
動的なサイズを持つデータ構造が有る時、常に物事は複雑になります。
そして文字列もまたサイズを変更することができるデータ構造です。
これはつまり、Rustの文字列もまた、Cのような他のシステム言語とは少し異なるということです。


<!-- Let’s dig into the details. A ‘string’ is a sequence of Unicode scalar values -->
<!-- encoded as a stream of UTF-8 bytes. All strings are guaranteed to be a valid -->
<!-- encoding of UTF-8 sequences. Additionally, unlike some systems languages, -->
<!-- strings are not null-terminated and can contain null bytes. -->
詳しく見ていきましょう、 「文字列」は、UTF-8のバイトストリームとしてエンコードされたユニコードのスカラー値のシーケンスです。
すべての文字列は、正しくエンコードされたUTF-8のシーケンスであることが保証されています。
また、他のシステム言語とはことなり、文字列はnull終端でなく、nullバイトを含むことが可能です。

<!-- Rust has two main types of strings: `&str` and `String`. Let’s talk about -->
<!-- `&str` first. These are called ‘string slices’. A string slice has a fixed -->
<!-- size, and cannot be mutated. It is a reference to a sequence of UTF-8 bytes. -->
Rustは主要な文字列型を二種類持っています: `&str` と `String`です。
まず `&str` について説明しましょう。 `&str` は「文字列のスライス」と呼ばれます。
文字列のスライスは固定のサイズを持ち、変更不可能です。そして、文字列のスライスはUTF-8のバイトシーケンスへの参照です。


```rust
let greeting = "Hello there."; // greeting: &'static str
```

<!-- `"Hello there."` is a string literal and its type is `&'static str`. A string -->
<!-- literal is a string slice that is statically allocated, meaning that it’s saved -->
<!-- inside our compiled program, and exists for the entire duration it runs. The -->
<!-- `greeting` binding is a reference to this statically allocated string. Any -->
<!-- function expecting a string slice will also accept a string literal. -->
`"Hello there."` は文字列リテラルであり、 `&'static str` 型を持ちます。
文字列リテラルは、静的にアロケートされた文字列のスライスであり、これはつまりコンパイルされたプログラム中に保存されており、
プログラムの実行中全てにわたって存在していることを意味しています。
どの文字列のスライスを引数として期待している関数も、文字列リテラルを引数に取ることができます。

<!-- String literals can span multiple lines. There are two forms. The first will -->
<!-- include the newline and the leading spaces: -->
文字列リテラルは複数行に渡ることができます。
複数行の文字列リテラルを記述する方法は、2つの形式があります。
一つ目の形式は、改行と行頭の空白を文字列に含む形式です:

```rust
let s = "foo
    bar";

assert_eq!("foo\n        bar", s);
```

<!-- The second, with a `\`, trims the spaces and the newline: -->
もう一つは `\` を用いて、空白と改行を削る形式です:

```rust
let s = "foo\
    bar";

assert_eq!("foobar", s);
```

<!-- Rust has more than just `&str`s though. A `String`, is a heap-allocated string. -->
<!-- This string is growable, and is also guaranteed to be UTF-8. `String`s are -->
<!-- commonly created by converting from a string slice using the `to_string` -->
<!-- method. -->
Rustは `&str` だけでなく、 `String` というヒープにアロケートされる文字列の形式も持っています。
この文字列は伸張可能であり、またUTF-8であることが保証されています。
`String` は一般的に文字列のスライスをメソッド `to_string` を用いて変換することで生成されます。

```rust
let mut s = "Hello".to_string(); // mut s: String
println!("{}", s);

s.push_str(", world.");
println!("{}", s);
```

<!-- `String`s will coerce into `&str` with an `&`: -->
`String` は `&` によって `&str` に型強制されます。

```rust
fn takes_slice(slice: &str) {
    println!("Got: {}", slice);
}

fn main() {
    let s = "Hello".to_string();
    takes_slice(&s);
}
```

<!-- This coercion does not happen for functions that accept one of `&str`’s traits -->
<!-- instead of `&str`. For example, [`TcpStream::connect`][connect] has a parameter -->
<!-- of type `ToSocketAddrs`. A `&str` is okay but a `String` must be explicitly -->
<!-- converted using `&*`. -->
このような変換は `&str` の代わりに、 `&str` のトレイトを引数として期待している関数では自動的には行われません。
たとえば、 [`TcpStream::connect`][connect] は引数として型 `ToSocketAddrs` を要求しています。
このような関数には `&str` は渡せますが、 `String` は `&*` を用いて明示的に変換する必要があります。

```rust,no_run
use std::net::TcpStream;

# // TcpStream::connect("192.168.0.1:3000"); // &str parameter
TcpStream::connect("192.168.0.1:3000"); // 引数として &str を渡す

let addr_string = "192.168.0.1:3000".to_string();
# // TcpStream::connect(&*addr_string); // convert addr_string to &str
TcpStream::connect(&*addr_string); // addr_string を &str に変換して渡す
```

<!-- Viewing a `String` as a `&str` is cheap, but converting the `&str` to a -->
<!-- `String` involves allocating memory. No reason to do that unless you have to! -->
`String` を `&str` として見るコストは低いですが、`&str` を `String` に変換するのはメモリのアロケーションを発生させます。
必要がなければ、やるべきではないでしょう!

<!-- ## Indexing  -->
## インデクシング

<!-- Because strings are valid UTF-8, strings do not support indexing: -->
文字列が正しいUTF-8であるため、文字列はインデクシングをサポートしていません:

```rust,ignore
let s = "hello";

# // println!("The first letter of s is {}", s[0]); // ERROR!!!
println!("The first letter of s is {}", s[0]); // エラー!!!
```

<!-- Usually, access to a vector with `[]` is very fast. But, because each character -->
<!-- in a UTF-8 encoded string can be multiple bytes, you have to walk over the -->
<!-- string to find the nᵗʰ letter of a string. This is a significantly more -->
<!-- expensive operation, and we don’t want to be misleading. Furthermore, ‘letter’ -->
<!-- isn’t something defined in Unicode, exactly. We can choose to look at a string as -->
<!-- individual bytes, or as codepoints:-->
普通、ベクタへの `[]` を用いたアクセスはとても高速です。
しかし、UTF-8にエンコードされた文字列中の一つ一つの文字は複数のバイトであることが可能なため、
文字列のn番の文字を探すためには文字列上を移動していく必要があります。
そのような作業はとても高コストな演算であり、誤解してはならない点です。
さらに言えば、「文字」というものはUnicodeにおいては正確に定義されていません。
文字列を、それぞれのバイトとして見ることも、コードポイントの集まりとして見ることもできるのです。

```rust
let hachiko = "忠犬ハチ公";

for b in hachiko.as_bytes() {
    print!("{}, ", b);
}

println!("");

for c in hachiko.chars() {
    print!("{}, ", c);
}

println!("");
```

<!-- This prints: -->
これは、以下の様な出力をします:

```text
229, 191, 160, 231, 138, 172, 227, 131, 143, 227, 131, 129, 229, 133, 172,
忠, 犬, ハ, チ, 公,
```

<!-- As you can see, there are more bytes than `char`s.-->
ご覧のように、 `char` の数よりも多くのバイトが含まれています。

<!-- You can get something similar to an index like this: -->
インデクシングするのと近い結果を以下の様にして得ることができます:

```rust
# let hachiko = "忠犬ハチ公";
let dog = hachiko.chars().nth(1); // hachiko[1]のような感じで
```

<!-- This emphasizes that we have to walk from the beginning of the list of `chars`. -->
このコードは、`chars` のリストの上を移動している事を強調しています。

## スライシング

<!-- You can get a slice of a string with slicing syntax: -->
文字列のスライスは以下のようにスライス構文を用いて取得することができます:

```rust
let dog = "hachiko";
let hachi = &dog[0..5];
```

<!-- But note that these are _byte_ offsets, not _character_ offsets. So -->
<!-- this will fail at runtime: -->
しかし、注意しなくてはならない点はこれらのオフセットは _バイト_ であって _文字_ のオフセットではないという点です。
そのため、以下のコードは実行時に失敗します:

```rust,should_panic
let dog = "忠犬ハチ公";
let hachi = &dog[0..2];
```

<!-- with this error: -->
そして、次のようなエラーが発生します:


```text
thread '<main>' panicked at 'index 0 and/or 2 in `忠犬ハチ公` do not lie on
character boundary'
```

<!-- ## Concatenation -->
## 結合

<!-- If you have a `String`, you can concatenate a `&str` to the end of it: -->
`String` が存在するとき、 `&str` を末尾に結合することができます:

```rust
let hello = "Hello ".to_string();
let world = "world!";

let hello_world = hello + world;
```

<!-- But if you have two `String`s, you need an `&`: -->
しかし、２つの `String` を結合するには、 `&` が必要になります:

```rust
let hello = "Hello ".to_string();
let world = "world!".to_string();

let hello_world = hello + &world;
```

<!-- This is because `&String` can automatically coerce to a `&str`. This is a -->
<!-- feature called ‘[`Deref` coercions][dc]’. -->
これは、 `&String` が自動的に `&str` に型強制されるためです。
このフィーチャーは 「 [`Deref` による型強制][dc] 」と呼ばれています。

[dc]: deref-coercions.html
[connect]: ../std/net/struct.TcpStream.html#method.connect
