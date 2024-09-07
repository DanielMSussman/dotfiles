return {
    {
        "epwalsh/pomo.nvim",
        version = "*",  -- Recommended, use latest release instead of latest commit
        --event = "VeryLazy",
        lazy = true,
        cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
        dependencies = {"telescope.nvim"},
        opts = {
        },
        config = function()
            require("pomo").setup({
            --from epwalsh
            update_interval=5000,
            notifiers = {
                { name = "Default", opts = { sticky = false } },
              --  { name = "System" }, -- rings the system bell... a bit annoying, and not implemented in Windows by default?
            },
            timers = {
                Stretching = {
                    { name = "Default" },
--                    { name = "System" },
                },
                Break = {
                    { name = "Default" },
--                    { name = "System" },
                },
                ["Work"] = {
                    { name = "Default", opts = { sticky = false } },
--                    { name = "System" },
                },
                ["Short Break"] = {
                    { name = "Default", opts = { sticky = false } },
--                    { name = "System" },
                },
                ["Long Break"] = {
                    { name = "Default", opts = { sticky = true } },
--                    { name = "System" },
                },
            },
            sessions = {
                pomotest = {
                    { name = "Work", duration = "25s" },
                    { name = "Short Break", duration = "5s" },
                },
                pomodoroPod = {
                    { name = "Work", duration = "25m" },
                    { name = "Short Break", duration = "5m" },
                },
                pomodoroHour = {
                    { name = "Work", duration = "25m" },
                    { name = "Short Break", duration = "5m" },
                    { name = "Work", duration = "25m" },
                    { name = "Short Break", duration = "5m" },
                },
                classicPomodoro = {
                    { name = "Work", duration = "25m" },
                    { name = "Short Break", duration = "5m" },
                    { name = "Work", duration = "25m" },
                    { name = "Short Break", duration = "5m" },
                    { name = "Work", duration = "25m" },
                    { name = "Short Break", duration = "5m" },
                    { name = "Work", duration = "25m" },
                    { name = "Long Break", duration = "30m" },
                },
            },
            })
        end,
    },
}
