return {
  "MysticalDevil/inlay-hints.nvim",
  event = "LspAttach",
  config = function()
    require("inlay-hints").setup()
  end,
}
