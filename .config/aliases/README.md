# Aliases files

All aliases should work both in `bash` and in `zsh`. Main alias file is sourced
in main `.shellrc` file and all other files are sourced from main alias file.
`.aliases` file is intended for general purpose aliases, while
`.git_aliases` and `.docker_aliases` are for git and docker related aliases.
In zsh git aliases are handled by git plugin and aliases shortcuts are made
to match those in the plugin, even though some of them have altered behavior.
`.local_aliases` is intended for env/project specific aliases and is not
supposed to be tracked in *.dotfiles* git. `.custom_aliases` file is intended
for user specific short term aliases and is completely up you, if you want to
track it.

`h` in the prompt will produce these alias descriptions:
(See respective files and `functions.sh` for more details.)
```sh
                 BASH ALIASES DESCRIPTIONS                 

@ /home/marpauli/.config/aliases/.aliases
--------------------- General aliases ---------------------
    ll :: ll
    lh :: ll in human readable format
    dh :: du all items in folder, human readable
    pf :: preview/find file using fzf and bat
   cdf :: cd to dir using fuzzy finder (fzf)
          (executed from / or /home might be slow)
  cdtf :: cd to file's directory
     g :: grep shorthand
    py :: python 3.12 interpreter/REPL
    sq :: sqlite3 with --table
    sa :: source ~/.config/aliases/.aliases
    ea :: edit aliases files ('ea h' for help)
    xc :: copy <text> to clipboard
     h :: print alias description
   dot :: add file to dotfiles repo
----------------------- Dev aliases -----------------------
    nv :: neovim (LazyVim)
   nvf :: open multiple files with fzf& bat in neovim
   nvc :: cd to nvim config folder
   ape :: activate poetry environment
   r2r :: SyncSuite rsync to remote
   rfm :: SyncSuite file map

@ /home/marpauli/.config/aliases/.git_aliases
----------------------- Git aliases -----------------------
   gst :: git status
   gfa :: git fetch all
    gd :: git diff
   gdn :: git diff numbered 
          (with filenum works only in repo root)
  gcpm :: git commit and push with message
   gco :: git checkout with tab completion
   gsu :: git submodule update
  gstm :: git stash with message
  gstl :: git stash list
  gstp :: git stash patch <#>
  gsta :: git stash apply <#>
  gstd :: gti stash drop <#>
    pc :: run pre-commit on changed files only
    gp :: git profile

@ /home/marpauli/.config/aliases/.docker_aliases
--------------------- Docker aliases ---------------------
    da :: show docker containers
    ds :: start or stop docker <container>
   dsa :: stop all docker containers
    dr :: remove docker <container>
   dra :: remove all docker containers
   dia :: list docker images in 'repo:tag'
   dri :: remove docker <image>
  dria :: remove all docker images
-----------------------------------------------------------
```
