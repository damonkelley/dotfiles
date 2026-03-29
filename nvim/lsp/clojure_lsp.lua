-- Clojure Language Server
local clojure_lsp = vim.fn.stdpath("data") .. "/mason/bin/clojure-lsp"

return {
  cmd = { clojure_lsp },
  filetypes = { 'clojure', 'edn' },
  root_markers = {'workspace.edn', 'project.clj', 'deps.edn', 'build.boot', 'shadow-cljs.edn', '.git' },
}
