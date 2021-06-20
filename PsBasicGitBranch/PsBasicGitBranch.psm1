function Write-GitDiff {
	
	$file_added_count = 0
	$file_updated_count = 0
	$file_deleted_count = 0
	
	$changes = git diff-index --name-status HEAD
	
	if (-Not [string]::IsNullOrEmpty($changes)) {
		$file_added_count = [Regex]::Matches($changes, "A`t").Count
		$file_updated_count = [Regex]::Matches($changes, "M`t").Count
		$file_deleted_count = [Regex]::Matches($changes, "D`t").Count
	}
	
	Write-Host "+$file_added_count ~$file_updated_count -$file_deleted_count " -NoNewLine -ForegroundColor Yellow
}

function Write-GitBranch {
	
	try {
		$branches = git branch
		
		if ([string]::IsNullOrEmpty($branches)) {
			# New repo with no branches
			return Write-Host " (no branches yet) " -NoNewLine -ForegroundColor Yellow
		}
		
		$branch = git rev-parse --abbrev-ref HEAD
		
		if ($branch -eq "HEAD") {
			# Print the SHA if in a detached HEAD state
			$branch = git rev-parse --short HEAD
			Write-Host " ($branch) " -NoNewLine -ForegroundColor Red
		} else {
			# Print the branch name
			Write-Host " ($branch) " -NoNewLine -ForegroundColor Cyan
		}
		
		# Print file diff counts
		Write-GitDiff
	
	} catch {
		return
	}
}

function prompt {
	
	# Set console title to current location
	$host.ui.rawui.WindowTitle = $(get-location)
	
	$prompt_base = "PS $($executionContext.SessionState.Path.CurrentLocation)"
	$prompt_level = "$('>' * ($nestedPromptLevel + 1)) "
	
	# Check if the current directory contains a git repository (.git folder)
	if (Test-Path -Path ".git") {
		Write-Host $prompt_base -NoNewLine
		Write-GitBranch
		return $prompt_level
	}
	else {
		# Use the default powershell prompt
		return $prompt_base + $prompt_level
	}
}
