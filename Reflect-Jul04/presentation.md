# Swifts Reflect

---

## But first
# Golangs reflect

---

```go
type Type interface {
        Align() int
        FieldAlign() int
        Method(int) Method
        MethodByName(string) (Method, bool)
        NumMethod() int
        Name() string
        PkgPath() string
        Size() uintptr
        String() string
        Kind() Kind
        Implements(u Type) bool
        AssignableTo(u Type) bool
        ConvertibleTo(u Type) bool
        Comparable() bool
        Bits() int
        ChanDir() ChanDir
        IsVariadic() bool
        In(i int) Type
        Key() Type
        Len() int
        NumField() int
        NumIn() int
        NumOut() int
        Out(i int) Type
        Elem() Type
        Field(i int) StructField
        FieldByIndex(index []int) StructField
        FieldByName(name string) (StructField, bool)
        FieldByNameFunc(match func(string) bool) (StructField, bool)
}
```

---

```swift
func reflect(type: Any.Type) -> Type

class Type : Equatable {

    var pointer: UnsafeRawPointer
    var kind: Kind { get }
    var type: Any.Type { get }
    init(type: Any.Type)
    static func ==(lhs: Type, rhs: Type) -> Bool
}

final class StructType : Type {

    var mangledName: String { get }
    var numberOfFields: Int { get }
    var fieldOffsets: [Int] { get }
    var fieldNames: [String] { get }
    var fieldTypes: [Type]? { get }
    var isGeneric: Bool { get }
}

final class TupleType : Type {

    var numberOfElements: Int { get }
    var elementTypes: [Any.Type] { get }
    var elementOffsets: [Int] { get }
}

```

---

```swift
final class EnumType : Type {

    var isOptionalType: Bool { get }
    var mangledName: String { get }
    var numberOfPayloadCases: Int { get }
    var payloadSizeOffset: Int { get }
    var numberOfNoPayloadCases: Int { get }
    var numberOfCases: Int { get }
    var caseNames: [String] { get }
    var caseTypes: [Any.Type]? { get }
    func isIndirect(at index: Int) -> Bool
    var isGeneric: Bool { get }
}

class FunctionType : Type {

    var numberOfArguments: Int { get }
    var resultType: Type { get }
    var argumentTypes: [Type] { get }
    func argumentType(at index: Int) -> Type
    func isParamInout(at index: Int) -> Bool
    var hasInoutArguments: Bool { get }
}

class ExistentialType : Type {

    var numberOfWitnessTables: Int { get }
    var hasClassConstraint: Bool { get }
    var numberOfProtocolsMakingComposition: Int { get }
    var isAnyType: Bool { get }
    var isAnyClassType: Bool { get }
    var protocolDescriptors: [ProtocolDescriptor] { get }
}
```

---

```swift
struct ProtocolDescriptor {

    var isa: Int
    var mangledName: UnsafePointer<CChar>
    var inheritedProtocolList: Int
    var objcA: Int
    var objcB: Int
    var objcC: Int
    var objcD: Int
    var objcE: Int
    var size: Int32
    var flags: Int32
}

extension Type {

    enum Kind {
        case `struct`
        case `enum`
        case optional
        case opaque
        case tuple
        case function
        case existential
        case metatype
        case objCClassWrapper
        case existentialMetatype
        case foreignClass
        case heapLocalVariable
        case heapGenericLocalVariable
        case errorObject
        case `class`
    }
}
```

---

```swift
func reflect(type: Any.Type) -> Type {

    let flag = unsafeBitCast(type, to: UnsafePointer<Int>.self).pointee
    let kind = Type.Kind(flag: flag)
    switch kind {
    case .struct:
        return StructType(type: type)

    case .tuple:
        return TupleType(type: type)

    case .enum, .optional:
        return EnumType(type: type)

    case .function:
        return FunctionType(type: type)

    case .existential:
        return ExistentialType(type: type)

    default:
        return Type(type: type)
    }
}
```

^ 
Firstly the value
