const std = @import("std");

pub fn main() void {
    const letter: []const u8 = "Hello world!";
    std.debug.print("{s}\n", .{letter});

    const slice1 = letter[0..2];
    const slice2 = letter[2..4];
    std.debug.print("{s} {s}\n", .{ slice1, slice2 });

    const fullSlice = letter[0..11];
    std.debug.print("{s}\n", .{fullSlice});
}
