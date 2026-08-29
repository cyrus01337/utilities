local DISABLED = false
local DELIMITER = " "
local Logger = {}

type Logger = {
    error: (...any) -> (),
    log: (...any) -> (),
    print: (...any) -> (),
    warn: (...any) -> (),
}

local function convertToString(...: any): string
    local converted = ""
    local values = { ... }

    for index, value in values do
        converted ..= `{value}{DELIMITER}`
    end

    return converted:sub(0, #converted - #DELIMITER)
end

function Logger.new(baseScript: BaseScript): Logger
    local self = {}
    local methods = {
        error = error,
        log = print,
        warn = warn,
    }

    for name, callback in methods do
        self[name] = function(...)
            if DISABLED then
                return
            end

            callback(`[{baseScript.Name}] {convertToString(...)}`)
        end
    end

    self.print = self.log

    return self
end

return Logger
