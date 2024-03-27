# Library loader on MacOS

https://github.com/olback/library-loader

I tried installing with docker but it didn't work so I tried the install from source.

## Clone project

```
gh repo clone olback/library-loader
```

## Install rust and cargo

https://www.rust-lang.org/tools/install

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

```

## Install docker

```

brew install docker

```

## Install apple command line tools

Check first if necessary

```
scode-select --install
```

## Run mac installation script

In the repo folder run

```
./macos-compile.sh
```

If you get a message stating "command not found", check file permissions with `ls -l macos-compile.sh`. If necessary change permissions to make executable with

```
chmod 755 macos-compile.sh
```

## Run library loader GUI

```
cargo run --bin library-loader-gui
```
