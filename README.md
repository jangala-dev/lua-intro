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

  - Crash course https://learnxinyminutes.com/docs/lua/
  - The manual, actually a good read https://www.lua.org/pil/contents.html
  - An in-depth article https://cacm.acm.org/magazines/2018/11/232214-a-look-at-the-design-of-lua/fulltext

### Concurrency

  - Concurrency is not Parallelism by Rob Pike https://www.youtube.com/watch?v=oV9rvDllKEg
  - An Incomplete History Of Language Facilities For Concurrency https://wingolog.org/archives/2016/10/12/an-incomplete-history-of-language-facilities-for-concurrency
  - What Color is Your Function? (Why separate 'async' syntax pollutes a language) https://journal.stuffwithstuff.com/2015/02/01/what-color-is-your-function/