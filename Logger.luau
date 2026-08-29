local Logger = {}

type Logger = {
    error: (string) -> (),
    log: (string) -> (),
    warn: (string) -> (),
}

local function addScriptPrefixTo(message: string, baseScript: BaseScript): string
    return `[{baseScript.Name}] {message}`
end

function Logger.new(baseScript: BaseScript): Logger
    local self = {}

    function self.error(message: string): ()
        error(addScriptPrefixTo(message, baseScript))
    end

    function self.log(message: string): ()
        error(addScriptPrefixTo(message, baseScript))
    end

    function self.warn(message: string): ()
        error(addScriptPrefixTo(message, baseScript))
    end

    return self
end

return Logger
