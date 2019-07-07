# github-clone

I store github projects under `~/src/github` folder, and instead of issuing a `cd` command, `ls` to check if I have one and finally `git clone` I can just run this line to immediately clone and fall into project folder, no matter where I been in the filesystem.

```
. github clone https://github.com/ReDetection/github-clone.git
```

Note the dot and a space before `github`, they matter! This expands to `source` to be able to change directory from a basj script.

### Features

* automatic cancellation of `.git` suffix for the projects
* on existing cloned projects, it will just `cd` into and do a `git fetch`
* `-t {type}` (defaults to `github`). Clone project to other folder
E.g. `-t work` will clone project to `~/src/work/PROJECTNAME`
* `--debug` will just show where the files go and does nothing.
