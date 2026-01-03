return {
    dir = "~/dev/yuvaldolev/agent.nvim/nvim-plugin",
    lazy = false,
    config = function()
        require("agent_amp").setup()
    end,
}
