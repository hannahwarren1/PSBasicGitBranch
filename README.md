# PSBasicGitBranch
A PowerShell module that displays the current git branch and file diff count on the prompt.

## Installation

Git needs to be installed and accessible from PowerShell. You can check by executing `git --version` from PowerShell. If `git` isn't recognised, ensure you have git installed and a path to git cmd in your PATH environment variable.

### Import the module

1. Download the PowerShell module.
2. Open your PowerShell profile script `Microsoft.PowerShell_profile.ps1` (usually located in `C:\Users\<user>\Documents\WindowsPowerShell`). If you do not have this file, you can create it.
3. Add the line `Import-Module <path-to-module\PSBasicGitBranch>` to your profile script and save it. This will automatically import the module each session.
4. Re-open PowerShell if it was already open or execute `Import-Module <path-to-module\PSBasicGitBranch>`

## Example
![example](https://user-images.githubusercontent.com/16664547/122673225-c584ef80-d212-11eb-8394-0731b7bb95ca.PNG)