pub const DataType = enum { string, integer, decimal, boolean };

pub const ColumnType = struct {
    datatype: union(DataType) {
        string: struct {
            length: ?u32 = null,
        },
        integer: struct {
            bits: u32,
            signed: bool,
        },
        decimal: struct {
            precision: u32,
            scale: u32,
        },
        boolean: void,
    },
    nullable: bool,
};

pub const TableColumn = struct {
    name: []const u8,
    index: u32,
    type: ColumnType,
};

pub const Table = struct {
    database: []const u8,
    schema: []const u8,
    name: []const u8,
    columns: []TableColumn,
};
