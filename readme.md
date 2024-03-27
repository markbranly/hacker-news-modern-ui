# Hacker News Modern and Friendly UI

## Design
Below is a quick look at the redesign. For more images and explanations of the design concept, [check out the Design Improvements page](https://github.com/markbranly/hacker-news-modern-ui/wiki/Design-Improvements).

<img width="896" alt="Hacker News Homepage with new design applied" src="https://github.com/markbranly/hacker-news-modern-ui/assets/78463/609213f5-b2f6-47fa-8225-de269f0c3d91">


## Why another Hacker News Redesign?
[Read the Project Brief](https://github.com/markbranly/hacker-news-modern-ui/wiki/Project-Brief).

## Roadmap
[View the Project Roadmap](https://github.com/markbranly/hacker-news-modern-ui/wiki/Roadmap).

## Build
Since the end result is a single CSS file, and the source files are modern Pure CSS, the build process for this project is fairly simple. 

Our build file, `userstyle.css`, provides the structure, or scaffolding, of the source files. 

All `@import` statements in the build file are replaced with their file contents during the build process to create the single file required by [UserStyles.world](https://userstyles.world/). A simple Makefile provides the build command:

```
$ make
```

An _experimental_ **watch** command is available as well:

```
$ make watch
```

This command utilizes the cross-platform file-monitoring utility, [fswatch](https://github.com/emcrisostomo/fswatch). Early indications are that it works quite well. 
