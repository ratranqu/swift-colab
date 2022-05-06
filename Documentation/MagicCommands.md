# Magic Commands

Swift Colab notebooks have various built-in commands for downloading external libraries and interacting with the operating system. These start with `%` and behave like the IPython [magic commands](http://ipython.org/ipython-doc/dev/interactive/magics.html). They take the role of inline Shell commands in Python notebooks, which start with `!`. Before executing a code block, the kernel extracts all magic commands and executes them in the order they appear. They are oblivious to the surrounding Swift code, whereas Python Shell commands follow the control flow of Python code.

Percent directives are implemented in [PreprocessAndExecute.swift](https://github.com/philipturner/swift-colab/blob/main/Sources/JupyterKernel/SwiftKernel/PreprocessAndExecute.swift) and [ProcessInstalls.swift](https://github.com/philipturner/swift-colab/blob/main/Sources/JupyterKernel/SwiftKernel/ProcessInstalls.swift).

- [`%include`](#include)
- [`%install`](#install)
- [`%install-extra-include-command`](#install-extra-include-command)
- [`%install-location`](#install-location)
- [`%install-swiftpm-flags`](#install-swiftpm-flags)
- [`%system`](#system)

TODO: Each should have an example of usage in its description.

## `%include`
```
%include FILEPATH
```

- Doesn't include a file twice, clarify what that means with an example, it does that for exclusivity of type objects. LLDB allows re-declaring of symbols, which is fine for local variables but not for type objects which get overwritten.
- Does it inject code in the middle of a Swift source file? I don't think so because they are parsed beforehand.

## `%install`
```
%install SPEC PRODUCT [PRODUCT ...]
```

- The command that downloads Swift packages.
- Swift 4.2-style package initializer for ergonomics and backward compatibility.
- Has `$cwd` substitution (describe).
- How to prevent a package from recompiling (same toolchain, same SwiftPM flags)
- This is also the command that loads a package into LLDB, so must run before calling `import XXX`

## `%install-extra-include-command`
```
%install-extra-include-command
```

- Link to forum thread that initiated this

## `%install-location`
```
%install-location
```

- Link to PR that initiated this
- Has `$cwd` substitution (describe).

## `%install-swiftpm-flags`
```
%install-swiftpm-flags [FLAG ...]
```

- Appends the arguments to a growing list of flags every time you execute
- The `$clear` flag, was added to allow emptying SwiftPM flags. If you have `$clear` before other flags, it resets then adds the flags to the right of it.

## `%system`
```
%system EXECUTABLE [ARGUMENT ...]
```

- Executes a command-line command, executes before the code in the cell
- Does not forward print output (yet), so better to use bash in Python mode right now
- Does it work with stuff like `mkdir`, `ls`, `touch`?