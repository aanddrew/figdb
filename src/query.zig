pub const data = @import("data.zig");

pub const LiteralValue = union {
    string: []const u8,
    integer: u64,
    float: f64,
    boolean: bool,
};

pub const TableIdentifier = union {
    name: struct {
        database: ?[]u8 = null,
        schema: ?[]u8 = null,
        table: []u8,
    },
    alias: []u8,
};

pub const ColumnValue = struct {
    tableIdentifier: TableIdentifier,
    columnName: []u8,
};

pub const Expression = struct {
    value: union {
        literal: LiteralValue,
        column: ColumnValue,
    },
    type: data.SqlType,
};

pub const Select = struct {
    values: []Expression,
    from: ?Expression = null,
};
