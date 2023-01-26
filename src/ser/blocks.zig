////////////////////////////////////////////////////////////////////////
// Standard Library
////////////////////////////////////////////////////////////////////////

/// Serialization block for `std.mem.Allocator` values.
pub const Allocator = @import("blocks/allocator.zig");

/// Serialization block for `std.ArrayList` values.
pub const ArrayList = @import("blocks/array_list.zig");

/// Serialization block for `std.BoundedArray` values.
pub const BoundedArray = @import("blocks/bounded_array.zig");

/// Serialization block for `std.BufMap` values.
pub const BufMap = @import("blocks/buf_map.zig");

/// Serialization block for `std.HashMap` values.
pub const HashMap = @import("blocks/hash_map.zig");

/// Serialization block for `std.SinglyLinkedList` values.
pub const LinkedList = @import("blocks/linked_list.zig");

/// Serialization block for `std.net.Address` values.
pub const NetAddress = @import("blocks/net_address.zig");

/// Serialization block for `std.PackedIntArray` and `std.PackedIntSlice` values.
pub const PackedInt = @import("blocks/packed_int.zig");

/// Serialization block for `std.TailQueue`.
pub const TailQueue = @import("blocks/tail_queue.zig");

////////////////////////////////////////////////////////////////////////////
// Struct
//
// IMPORTANT: All user-defined types must be listed BEFORE this section.
////////////////////////////////////////////////////////////////////////////

/// Serialization block for `struct` values.
pub const Struct = @import("blocks/struct.zig");

////////////////////////////////////////////////////////////////////////
// Primitives
////////////////////////////////////////////////////////////////////////

/// Serialization block for array values.
pub const Array = @import("blocks/array.zig");

/// Serialization block for `bool` values.
pub const Bool = @import("blocks/bool.zig");

/// Serialization block for `enum` values.
pub const Enum = @import("blocks/enum.zig");

/// Serialization block for `error` values.
pub const Error = @import("blocks/error.zig");

/// Serialization block for floating-point values.
pub const Float = @import("blocks/float.zig");

/// Serialization block for integer values.
pub const Int = @import("blocks/int.zig");

/// Serialization block for `null` values.
pub const Null = @import("blocks/null.zig");

/// Serialization block for optional values.
pub const Optional = @import("blocks/optional.zig");

/// Serialization block for pointer values.
pub const Pointer = @import("blocks/pointer.zig");

/// Serialization block for slice values.
pub const Slice = @import("blocks/slice.zig");

/// Serialization block for string values.
pub const String = @import("blocks/string.zig");

/// Serialization block for tuple values.
pub const Tuple = @import("blocks/tuple.zig");

/// Serialization block for `union` values.
pub const Union = @import("blocks/union.zig");

/// Serialization block for vector values.
pub const Vector = @import("blocks/vector.zig");

/// Serialization block for `void` values.
pub const Void = @import("blocks/void.zig");