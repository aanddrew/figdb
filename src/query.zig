pub const data = @import("data.zig");

const TableIdentifierTag = enum { name, alias };

pub const TableIdentifier = union(TableIdentifierTag) {
    name: struct {
        database: ?[]u8 = null,
        schema: ?[]u8 = null,
        table: []u8,
    },
    alias: []u8,
};

pub const ColumnValue = struct {
    tableIdentifier: TableIdentifier,
    type: data.ColumnType,
    columnName: []u8,
};

pub const LiteralValueNullTag = enum { null, not_null };

pub const LiteralValue = union(LiteralValueNullTag) {
    not_null: union(data.DataType) {
        string: []const u8,
        integer: i64,
        decimal: struct {
            left: i64,
            right: i64,
        },
        boolean: bool,
    },
    null: void,
};

pub const ValueExpressionTag = enum {
    literal,
    column,
};

pub const Expression = struct {
    value: union(ValueExpressionTag) {
        literal: LiteralValue,
        column: ColumnValue,
    },
    alias: ?[]const u8 = null,
};

pub const Select = struct {
    values: []Expression,
    from: ?Expression = null,
};
