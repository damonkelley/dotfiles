local fzf = require('fzf-lua')

local function function_picker()
    local funcs = {
        {
            name = "Format",
            func = function()
                vim.lsp.buf.format({ async = true })
            end
        },
    }

    local entries = {}
    for _, item in ipairs(funcs) do
        table.insert(entries, item.name)
    end

    fzf.fzf_exec(entries, {
        prompt = 'Select function> ',
        actions = {
            ['default'] = function(selected)
                local choice = selected[1]
                for _, item in ipairs(funcs) do
                    if item.name == choice then
                        item.func()
                        break
                    end
                end
            end
        }
    })
end

vim.keymap.set('n', '<leader><Enter>', function_picker, { desc = "Run Action Picker" })
