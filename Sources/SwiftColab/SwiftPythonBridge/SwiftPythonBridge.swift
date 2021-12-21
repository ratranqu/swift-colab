// small dynamic library for calling Swift functions from Python
// will import PythonKit eventually, but for now, use OpaquePointer instead of PythonObject
// can also be imported from Swift, as it defines the function wrapper struct

// 6 accepted Swift types;
// @convention(c) (PythonObject) throws -> Void
// @convention(c) (PythonObject) throws -> PythonObject
// (PythonObject) throws -> Void
// (PythonObject) throws -> PythonObject
// @differentiable(reverse) (Differentiable & PythonConvertible) throws -> Void // might remove PythonConvertible restriction
// @differentiable(reverse) (Differentiable & PythonConvertible) throws -> Differentiable & PythonConvertible // might remove PythonConvertible restriction

// The differentiable function types will be especially hard to implement. I need to find a way to work around not being 
// able to differentiate the operation of bridging to a Python type. In addition, autodiff isn't fully functional right now.
// So, differentiable function types won't be supported yet.
