const std = @import("std");
const query = @import("query.zig");
const data = @import("data.zig");
// DATA SECTION

pub fn main() !void {
    const hello: query.Expression = .{
        .literal = .{ .not_null = .{ .string = "hello" } },
    };
    var expr_list: [1]query.Expression = .{hello};

    const select = query.Select{ .values = &expr_list };
    _ = select;
}

// test "" {
// const select = Select{
// .values = null,
// };
// }
