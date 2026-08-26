export type Table<Value = any, Key = any> = { [Key]: Value }
export type Record<Key = string, Value = any> = Table<Value, Key>
export type Array<Value = any> = Table<Value, number>
export type WeakTable<Key = any, Value = any, Mode = "k" | "v" | "kv"> = Table<Value, Key>
local TableLiteral: Table = {}
local RecordLiteral: Record = {}
local ArrayLiteral: Array = {}
local Types = {
    Number = 0,
    String = "",
    Table = TableLiteral,
    Record = RecordLiteral,
    Array = ArrayLiteral,
}

function Types.unsafeForceCast<To, From>(value: From): To
    return (value :: any) :: To
end

return Types
