% プログラミング言語Rust
<!-- % The Rust Programming Language -->

<!-- Welcome! This book will teach you about the [Rust Programming Language][rust]. -->
<!-- Rust is a systems programming language focused on three goals: safety, speed, -->
<!-- and concurrency. It maintains these goals without having a garbage collector, -->
<!-- making it a useful language for a number of use cases other languages aren’t -->
<!-- good at: embedding in other languages, programs with specific space and time -->
<!-- requirements, and writing low-level code, like device drivers and operating -->
<!-- systems. It improves on current languages targeting this space by having a -->
<!-- number of compile-time safety checks that produce no runtime overhead, while -->
<!-- eliminating all data races. Rust also aims to achieve ‘zero-cost abstractions’ -->
<!-- even though some of these abstractions feel like those of a high-level language. -->
<!-- Even then, Rust still allows precise control like a low-level language would. -->

ようこそ!この本は[プログラミング言語Rust][rust]の教材です。Rustは安全性、速度、並行性の3つのゴールにフォーカスしたシステムプログラミング言語です。
ガーベジコレクタなしにこれらのゴールを実現していて、他の言語への埋め込み、要求された空間や時間内での動作、
デバイスドライバやオペレーティングシステムのような低レベルなコードなど他の言語が苦手とする多数のユースケースを得意とします。
全てのデータ競合を排除しつつも実行時オーバーヘッドのないコンパイル時の安全性検査を多数持ち、これらの領域をターゲットに置く既存の言語を改善します。
Rustは高級言語のような抽象化も含めた「ゼロコスト抽象化」も目標としています。
そうでありつつもなお低級言語のような精密な制御も許します。

[rust]: https://www.rust-lang.org

<!-- “The Rust Programming Language” is split into chapters. This introduction -->
<!-- is the first. After this: -->

「プログラミング言語Rust」はいくつかの章に分かれています。このイントロダクションが一番最初の章です。
この後は

<!-- * [Getting started][gs] - Set up your computer for Rust development. -->
<!-- * [Tutorial: Guessing Game][gg] - Learn some Rust with a small project. -->
<!-- * [Syntax and Semantics][ss] - Each bit of Rust, broken down into small chunks. -->
<!-- * [Effective Rust][er] - Higher-level concepts for writing excellent Rust code. -->
<!-- * [Nightly Rust][nr] - Cutting-edge features that aren’t in stable builds yet. -->
<!-- * [Glossary][gl] - A reference of terms used in the book. -->
<!-- * [Bibliography][bi] - Background on Rust's influences, papers about Rust. -->

* [はじめる][gs] - Rust開発へ向けた環境構築です。
* [チュートリアル：数当てゲーム][gg] - 小さなプロジェクトを通してRustについて学びます。
* [シンタックスとセマンティクス][ss] - Rustについて一歩ずつ、小さく分割しながらやっていきます。
* [Effective Rust][er] - 良いRustのコードを書くための高レベルな概念です。
* [Nightly Rust][nr] - 安定版のRustでは使えないRustの最前線の機能です。
* [用語集][gl] - 本書で使われる用語の参考です。
* [関係書目][bi] - Rustへ影響を与えたもの、Rustに関する論文です。

[gs]: getting-started.html
[gg]: guessing-game.html
[er]: effective-rust.html
[ss]: syntax-and-semantics.html
[nr]: nightly-rust.html
[gl]: glossary.html
[bi]: bibliography.html

<!-- ### Contributing -->
### 貢献する

<!-- The source files from which this book is generated can be found on -->

本書を生成するのに使われたソースは以下から入手出来ます
[GitHub][book].

[book]: https://github.com/rust-lang/rust/tree/master/src/doc/book

> 訳注: 日本語の翻訳文書は以下から入手出来ます。
> [GitHub][bookja].
>

[bookja]: https://github.com/rust-lang-ja/the-rust-programming-language-ja/tree/master/1.9/ja/book
