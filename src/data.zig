pub const SqlType = struct {
    type: enum {
        String,
        Integer,
        Decimal,
        Boolean,
        Table,
    },
    properties: union {
        string: ?struct {
            length: ?u32 = null,
        },
        decimal: ?struct {
            precision: u32,
            scale: u32,
        },
    },
    nullable: bool,
};

pub const TableColumn = struct {
    name: []u8,
    index: u32,
    type: SqlType,
};

pub const Table = struct {
    database: []u8,
    schema: []u8,
    name: []u8,
    columns: []TableColumn,
};
