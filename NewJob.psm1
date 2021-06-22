function New-Job {
    #Read config or generate a new one
    try {
        $config = get-content -Path "$PSScriptRoot/config.json" -ErrorAction Stop | ConvertFrom-Json 
      }
      catch [System.Management.Automation.ItemNotFoundException] {
    #Collecting infomation and write the new config
    Write-Output "Unable to locate configuration, generating new configuration"
    $Jobsearchroot = Read-Host "Please input the Full UNC Path of your job search, this is where you wish to have the cover letters and any other supporting documents stored in a directory per job basis"
    if ($Jobsearchroot.EndsWith('/') -ne 'true') {
      $Jobsearchroot = $Jobsearchroot + '/'
    }
    $draftletterloc = Read-Host "Please input the full UNC Path of the folder where draft cover letter is located"
    if ($draftletterloc.EndsWith('/') -ne 'true') {
      $draftletterloc = $draftletterloc + '/'
    }
    $draftletter = Read-Host "Please type the full filename of the draft cover letter, including the file extention"
    $valid = "true"
    $newconfig = @{
        Jobsearchroot = $Jobsearchroot
        draftletterloc = $draftletterloc
        draftletter = $draftletter
        valid = $valid 
    }
    #Store Configuration
    New-Item "$PSScriptRoot/config.json" -ItemType 'File'
    ConvertTo-Json $newconfig | Set-Content "$PSScriptRoot/config.json"
    }
    
    #Check configuration is valid 
    $validation = $config.valid
    if ($validation -ne "true" ) {
      #Collecting infomation and write the new config
    Write-Output "Unable to locate a vaild configuration, generating new configuration"
    $Jobsearchroot = Read-Host "Please input the Full UNC Path of your job search, this is where you wish to have the cover letters and any other supporting documents stored in a directory per job basis"
    if ($Jobsearchroot.EndsWith('/') -ne 'true') {
      $Jobsearchroot = $Jobsearchroot + '/'
    }
    
    $draftletterloc = Read-Host "Please input the full UNC Path of the folder where draft cover letter is located"
    if ($draftletterloc.EndsWith('/') -ne 'true') {
      $draftletterloc = $draftletterloc + '/'
    }
    $draftletter = Read-Host "Please type the full filename of the draft cover letter, including the file extention"
    $valid = "true"
    $newconfig = @{
        Jobsearchroot = $Jobsearchroot
        draftletterloc = $draftletterloc
        draftletter = $draftletter
        valid = $valid
      }
    #Store Configuration after removing the old invalid configuration
    Remove-Item "$PSScriptRoot/config.json"
    New-Item "$PSScriptRoot/config.json" -ItemType 'File'
    ConvertTo-Json $newconfig | Set-Content "$PSScriptRoot/config.json"
    }
    #Load configuration
    $Jobsearchroot = $config.Jobsearchroot
    $coverletter = $config.draftletterloc + $config.draftletter
    #Grab month and year 
    [string] $month = (Get-Date -UFormat %b) 
    [string] $year = (Get-Date).Year
    $date = $year +" " + $month
    #Get infomation from user
    Write-Output "What's the job title?"
    [String]$Jobtitle = Read-Host
    #Make new directory
    $Jobtitle = ($date + " - " + $Jobtitle)
    $Jobdir = $Jobsearchroot + $Jobtitle + '/'
    $Jobdir.ToString()
    New-Item $Jobdir -ItemType 'Directory'
    Copy-Item $coverletter -Destination $jobdir
    $coverletter = $Jobdir + $config.draftletter
    #Final step
    Write-Output 'Opening file, good luck! :)'
    Start-Sleep -Seconds 1.5
    Invoke-Item $coverletter
    }
