return {
  {
    "windwp/nvim-autopairs",
    opts = {} -- This triggers the setup() function
  },
  {
    "windwp/nvim-ts-autotag",
    opts = {
      skip_tags = {
        "br",
        "hr",
        "img",
        "Image",
        "input",
        "Input",
        "link",
        "Link"
      }
    }
  }
}
