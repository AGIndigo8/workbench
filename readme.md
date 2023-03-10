# Workbench
# A Directory with Benefits

## Intro

The workbench is to be treated like an actual desk. You put stuff here you are working on.
You can quickly put the files away for safe keeping and make a blank workbench or pick something up where you left off.
This is accomplished using drawers to save your stuff.

## Setup

Easy! Just copy `.bench.sh` script into a directory to make it a workbench!

Note: This is a bash script, so a unix type environment is necessary. If you are using Windows, you'll need to run it on WSL or Git Bash

## Drawers

Drawers give you the ability to quickly organize and switch between different sets of files in your workbench.
To do this you can use the following commands:

```
    ./.bench.sh stash
```

```
    ./.bench.sh stash dir_name
```

```
    ./.bench.sh swap dir_name
```

The `stash dir_name` command will move all of the files in the directory to a new directory in `./drawers/` with the given directory name.
The script will give an error if the directory name is already taken.
A file called `.stash` will be created to save the name of the directory for later stashing.

The `stash` command will move the files in the directory to a new directory in `./drawers/` with the name specified in the `.stash` file.
In order to use `stash` without specifying a directory name, a `.stash` file must be present.

The `swap dir_name` command will take all the files in the specified drawer directory and move them to the root directory of the workbench.
If there are currently files on your workbench, they will be moved back into their drawer directory specified by the `.stash` file.
If there are, in fact, files on the workbench and there is not a `.stash` file, it is required to first stash the workbench before performing a swap.

## Why?

A workbench is useful for a place to work. You can skip the part where you look for a place to save a file or project and get right to work. New idea? Fine just stash the old one and get started right away. Later you can go back and clean out your desk and move things to a permenant home or delete them forever. Thoughts might be sporatic at times, but your organization doesn't have to be!
