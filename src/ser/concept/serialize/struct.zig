const std = @import("std");

const concepts = @import("concepts");

const concept = "getty.ser.StructSerialize";

pub fn @"getty.ser.StructSerialize"(comptime T: type) void {
    comptime concepts.Concept(concept, "")(.{
        std.mem.eql(u8, @typeName(T), concept),
        concepts.traits.hasField(T, "context"),
        concepts.traits.hasDecls(T, .{ "Ok", "Error" }),
        concepts.traits.hasFunctions(T, .{ "serializeField", "end" }),
    });
}
