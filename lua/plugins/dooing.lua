return {
    "atiladefreitas/dooing",
    cmd = {"Dooing", "DooingLocal"},
    config = function()
        require("dooing").setup({
         timestamp = {
          enabled = false,
          },
         window = {
          width = 50,
          height = 15,
          },
        })
    end,
}
