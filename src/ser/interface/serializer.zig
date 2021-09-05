const std = @import("std");

/// A data format that can serialize any data type supported by Getty.
pub fn Serializer(
    comptime Context: type,
    comptime O: type,
    comptime E: type,
    comptime Map: type,
    comptime Sequence: type,
    comptime Struct: type,
    comptime Tuple: type,
    comptime boolFn: fn (Context, bool) E!O,
    comptime enumFn: fn (Context, anytype) E!O,
    comptime floatFn: fn (Context, anytype) E!O,
    comptime intFn: fn (Context, anytype) E!O,
    comptime mapFn: fn (Context, ?usize) E!Map,
    comptime nullFn: fn (Context) E!O,
    comptime sequenceFn: fn (Context, ?usize) E!Sequence,
    comptime stringFn: fn (Context, anytype) E!O,
    comptime structFn: fn (Context, comptime []const u8, usize) E!Struct,
    comptime tupleFn: fn (Context, ?usize) E!Tuple,
    comptime voidFn: fn (Context) E!O,
) type {
    const T = struct {
        context: Context,

        const Self = @This();

        pub const Ok = O;
        pub const Error = E;

        /// Serializes a `bool` value.
        pub fn serializeBool(self: Self, value: bool) Error!Ok {
            return try boolFn(self.context, value);
        }

        // Serialize an enum value.
        pub fn serializeEnum(self: Self, value: anytype) Error!Ok {
            switch (@typeInfo(@TypeOf(value))) {
                .Enum, .EnumLiteral => {},
                else => @compileError("expected enum, found `" ++ @typeName(@TypeOf(value)) ++ "`"),
            }

            return try enumFn(self.context, value);
        }

        /// Serializes a float-point value.
        pub fn serializeFloat(self: Self, value: anytype) Error!Ok {
            switch (@typeInfo(@TypeOf(value))) {
                .Float, .ComptimeFloat => {},
                else => @compileError("expected float, found `" ++ @typeName(@TypeOf(value)) ++ "`"),
            }

            return try floatFn(self.context, value);
        }

        /// Serializes an integer value.
        pub fn serializeInt(self: Self, value: anytype) Error!Ok {
            switch (@typeInfo(@TypeOf(value))) {
                .Int, .ComptimeInt => {},
                else => @compileError("expected float, found `" ++ @typeName(@TypeOf(value)) ++ "`"),
            }

            return try intFn(self.context, value);
        }

        /// Starts the serialization process for a map.
        pub fn serializeMap(self: Self, length: ?usize) Error!Map {
            return try mapFn(self.context, length);
        }

        /// Serializes a `null` value.
        pub fn serializeNull(self: Self) Error!Ok {
            return try nullFn(self.context);
        }

        /// Starts the serialization process for a sequence.
        pub fn serializeSequence(self: Self, length: ?usize) Error!Sequence {
            return try sequenceFn(self.context, length);
        }

        /// Serializes a string value.
        pub fn serializeString(self: Self, value: anytype) Error!Ok {
            if (comptime !std.meta.trait.isZigString(@TypeOf(value))) {
                @compileError("expected string, found `" ++ @typeName(@TypeOf(value)) ++ "`");
            }

            return try stringFn(self.context, value);
        }

        /// Starts the serialization process for a struct.
        pub fn serializeStruct(self: Self, comptime name: []const u8, length: usize) Error!Struct {
            return try structFn(self.context, name, length);
        }

        /// Starts the serialization process for a tuple.
        pub fn serializeTuple(self: Self, length: ?usize) Error!Tuple {
            return try tupleFn(self.context, length);
        }

        /// Serializes a `void` value.
        pub fn serializeVoid(self: Self) Error!Ok {
            return try voidFn(self.context);
        }
    };

    return struct {
        pub fn serializer(self: Context) T {
            return .{ .context = self };
        }
    };
}