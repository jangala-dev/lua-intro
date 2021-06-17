# Jangala Lua Dev Environement

Running this in VSCode will give you a Dockerised Linux Bash environment with all the dependencies installed, just like magic.

Steps to use:
  1. `git clone` this folder locally
  2. Install Docker https://www.docker.com/products/docker-desktop
  3. Install VSCode https://code.visualstudio.com/download
  4. Install the Remote Containers extension https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers
  5. Open this folder in VSCode, it should offer to reopen in a container, click yes.
  6. Lots of activity as the container is created and the script install 

Now you can open the [integrated terminal](https://code.visualstudio.com/docs/editor/integrated-terminal) in VSCode and you'll be in a linux container from which you can:
  - run the interactive lua REPL `lua`
  - run code from files `lua [filename]`


## Links

### Lua

> "Lua is a powerful, efficient, lightweight, embeddable scripting language. It supports procedural programming, object-oriented programming, functional programming, data-driven programming, and data description."
>
> "Lua combines simple procedural syntax with powerful data description constructs based on associative arrays and extensible semantics. Lua is dynamically typed, runs by interpreting bytecode with a register-based virtual machine, and has automatic memory management with incremental garbage collection, making it ideal for configuration, scripting, and rapid prototyping."

  - Crash course https://learnxinyminutes.com/docs/lua/ (some interesting comments in the Hacker News thread about the course https://news.ycombinator.com/item?id=23694667)  
  - The manual, actually a good read https://www.lua.org/pil/contents.html
  - An in-depth article https://cacm.acm.org/magazines/2018/11/232214-a-look-at-the-design-of-lua/fulltext

### Concurrency

> "Concurrency is the term we use to describe the scenario when you have two or more processes to attend to at the same time but only have the capacity to physically deal with only one of the processes at any point in time."

  - A really good article from the super-simple perspective of microcontrollers http://www.codingthearchitecture.com/2014/06/01/an_architecturally_evident_coding_style.html
  - Concurrency is not Parallelism by Rob Pike https://www.youtube.com/watch?v=oV9rvDllKEg
  - An Incomplete History Of Language Facilities For Concurrency https://wingolog.org/archives/2016/10/12/an-incomplete-history-of-language-facilities-for-concurrency
  - What Color is Your Function? (Why separate 'async' syntax pollutes a language) https://journal.stuffwithstuff.com/2015/02/01/what-color-is-your-function/