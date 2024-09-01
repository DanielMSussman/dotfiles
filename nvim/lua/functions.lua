-- Want a notification if we are ahead of or behind the remote:
currentGitStatus = {ahead = 0, behind = 0}
function update_currentGitStatus()
    local FetchJob = require'plenary.job'
--    vim.notify("fetching")
    FetchJob:new({
        command = 'git',
        args = { 'fetch' },
        on_exit = function(job,_)
            local Job = require'plenary.job'
 --           vim.notify("checking git rev-list")
            Job:new({
                command = 'git',
                args = { 'rev-list', '--left-right', '--count', 'HEAD...@{upstream}' },
                on_exit = function(job, _)
                    local res = job:result()[1]
--                    vim.notify(res)
                    --            if type(res) ~= 'string' then currentGitStatus = {ahead = 0, behind = 0}; return end
                    local ok, ahead, behind = pcall(string.match, res, "(%d+)%s*(%d+)")
                    if not ok then ahead, behind = 0, 0 end
                    currentGitStatus = {ahead = ahead, behind = behind}

                    if currentGitStatus.ahead ~="0" then  
                        vim.notify("Local ahead of remote",3) -- 3 is DiagnosticWarn hl_group
                    end
                    if currentGitStatus.behind ~= "0" then
                        vim.notify("Local is behind remote!",4) -- 4 is DiagnosticError hl_group.
                    end
                    if currentGitStatus.ahead =="0" and currentGitStatus.behind=="0" then
                        vim.notify("Local and remote are in sync")
                    end
                end,
                }):start()
            end
        }):start()
    end

