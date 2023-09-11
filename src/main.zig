const std = @import("std");
const query = @import("query.zig");
const data = @import("data.zig");
// DATA SECTION

pub fn main() !void {
    const hello: query.Expression = .{
        .value = .{
            .literal = .{
                .string = "hello",
            },
        },
        .type = .{
            .type = .String,
            .properties = .{
                .string = .{
                    .length = 5,
                },
            },
            .nullable = false,
        },
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
