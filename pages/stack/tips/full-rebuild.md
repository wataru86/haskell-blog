---
title: 完全なリビルド
date: 2017/12/24
---


## リビルド方法

通常 `stack build` でリビルドした際はキャッシュが利用されます。

しかし、場合によって (警告をもう一度みたいなど) はキャッシュを無視してリビルドしたい時があります。

`--force-dirty` や `--ghc-options=-fforce-recomp` などを使う方法もあるのですが、一番確実なのは `stack clean` することです。

```shell
$ stack clean
$ stack build
```

## 何をやってもだめな時

基本的には `stack clean` で上手く行くことが多いのですがどうしてもだめな場合は `--full` オプションを追加します。

```shell
$ stack clean --full
$ stack build
```

このオプションは以下のコマンドと同じ結果となります。

```shell
$ rm -rf .stack-work/
```