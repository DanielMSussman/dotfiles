Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadlineKeyHandler -Key "Tab" -Function Complete
Set-PSReadlineOption -BellStyle None 

function prompt {
        $p = $executionContext.SessionState.Path.CurrentLocation
        $osc7 = ""
        if ($p.Provider.Name -eq "FileSystem") {
            $ansi_escape = [char]27
            $provider_path = $p.ProviderPath -Replace "\\", "/"
            $osc7 = "$ansi_escape]7;file://${env:COMPUTERNAME}/${provider_path}${ansi_escape}\"
        }
        "${osc7}PS $p$('>' * ($nestedPromptLevel + 1)) ";
    }
# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

oh-my-posh init pwsh --config 'C:\Users\dmsussm\AppData\Local\Programs\oh-my-posh\themes\peru.omp.json' | Invoke-Expression
#oh-my-posh init pwsh --config 'C:\Users\dmsussm\AppData\Local\Programs\oh-my-posh\themes\nordtron.omp.json' | Invoke-Expression
Import-WslCommand "awk", "find", "grep", "head", "less", "ls", "man", "sed", "seq", "ssh", "sudo", "tail", "xdotool"
$WslDefaultParameterValues = @{}
$WslDefaultParameterValues["grep"] = "-E"
$WslDefaultParameterValues["less"] = "-i"
$WslDefaultParameterValues["ls"] = "-hl --group-directories-first --color=always"
$WslEnvironmentVariables = @{}
$WslEnvironmentVariables["LS_COLORS"]= "di=1;38;2;143;188;187:or=1;38;2;236;239;244;48;2;191;97;106:ln=1;38;2;163;190;140:ca=0:su=0:mi=1;38;2;236;239;244;48;2;191;97;106:ex=1;38;2;208;135;112:do=1;38;2;180;142;173;48;2;67;76;94:fi=0;38;2;76;86;106:so=1;38;2;180;142;173;48;2;67;76;94:ow=0:st=0:*~=0;38;2;67;76;94:pi=1;38;2;235;203;139;48;2;67;76;94:rs=0;38;2;76;86;106:mh=0:sg=0:cd=1;38;2;235;203;139;48;2;67;76;94:bd=1;38;2;235;203;139;48;2;67;76;94:no=0;38;2;76;86;106:tw=0"
