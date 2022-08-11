# Tasker Quick Start Tutorial

## Getting started

[Here is the Taskfile](../c01_getting_started/Taskfile.yml) to follow along.

First install Tasker according to [the instructions](https://taskfile.dev/installation) from the official site. I use [the Install Script](https://taskfile.dev/installation/#install-script)  
and it works just fine.

To create a new taskfile in the directory run a command:  
`task –init`  
A new file, Taskfile.yaml, will appear. Open this file in any text editor.  
It content will look like this:

```
# https://taskfile.dev

version: '3'

vars:
  GREETING: Hello, World!

tasks:
  default:
    cmds:
      - echo "{{.GREETING}}"
    silent: true
```

If you'll run a command `task` with no arguments, Tasker will run the `deafult`  
task, hence it's name.

To make your own task, type it below the exisiting one. Mind indentations,  
so that task name shold be indented the same amount as the `default` task  
name and so on. The result should look like this:

```
# https://taskfile.dev

version: '3'

vars:
  GREETING: Hello, World!

tasks:
  default:
    cmds:
      - echo "{{.GREETING}}"
    silent: true

  first-task:
    cmds:
      - echo "My first task runs fine"
```

Now try running `task first-task`. It should execute the command that you have  
written in `cmds` section.

So far so good. Now let's add the description to our task. First it's a good  
practice to know what the task's doing. Also, even if the task is self-explanatory,  
a description allows Tasker shell completion to work. For simple tasks like this  
just add a dummy `desc: _` line:

```
  first-task:
    desc: _
    cmds:
      - echo "My first task runs fine"
```

Now let's add more tasks. First of them will be almost exactly the same as before:

```
  get-started:
    desc: _
    cmds:
      - echo "Call any task to get started"
```

The next task is a little bit special: it calls another two tasks.  
Note that calling tasks goes like this: `- task: taskname` in `cmds` section.
  
```
  calling-tasks:
    desc: one task can call another tasks, like this one does
    cmds:
      - task: get-started
      - task: first-task
```
Note:

> You can use shell commands in task to call another task, like this:  
`- task taskname`  
but **it's not recommended**. It will work in simple situations when all the  
tasks are in one Taskfile in your working directory and no environment  
variables are involved. But in more complex setups it lead to confusion,  
so please consider using the native `task: taskname` method.
