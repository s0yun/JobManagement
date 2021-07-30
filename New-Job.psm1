function New-Job {
#Required libs
Add-Type -AssemblyName System.Windows.Forms

#Read config or generate a new one
try {
    $config = get-content -Path "$PSScriptRoot/config.json" -ErrorAction Stop | ConvertFrom-Json 
  }
  catch [System.Management.Automation.ItemNotFoundException] {
#Collecting infomation and write the new config
Write-Output "Unable to locate configuration, generating new configuration"
#Create a folder browser that's used during configuration generation
$FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
$FolderBrowser.Description = 'Please select the folder of your job search, this is where you wish to have the cover letters and any other supporting documents stored in a directory per job basis' 
[void]$FolderBrowser.ShowDialog()
[string] $Jobsearchroot = $FolderBrowser.SelectedPath
$Jobsearchroot = $Jobsearchroot + '\'

#File browser to select the cover letter
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{
  InitialDirectory = $HOME
  Filter = ' Word Docments (*.docx)|*.docx|Richtext Fomat  (*.rtf)|*.rtf|Text Document (*.txt)|*.txt'
  Title = 'Select your draft cover letter'
 }
 $FileBrowser.ShowDialog()
 [string]$draftletter = $FileBrowser.FileName
 $cleanfile = $FileBrowser.SafeFileName
 
$valid = "true"

#Save to hashtab for Json config
$newconfig = @{
    Jobsearchroot = $Jobsearchroot
    draftletter = $draftletter
    letter = $cleanfile
    valid = $valid 
}
#Store Configuration
New-Item "$PSScriptRoot/config.json" -ItemType 'File'
ConvertTo-Json $newconfig | Set-Content "$PSScriptRoot/config.json"
}

#Get the new configuration
$config = get-content -Path "$PSScriptRoot/config.json" -ErrorAction Stop | ConvertFrom-Json 
#Check configuration is valid 
$validation = $config.valid
if ($validation -ne "true" ) {
  #Collecting infomation and write the new config
Write-Output "Unable to locate a vaild configuration, generating new configuration"
#Create a folder browser that's used during configuration generation
$FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
$FolderBrowser.Description = 'Please select the folder of your job search, this is where you wish to have the cover letters and any other supporting documents stored in a directory per job basis' 
[void]$FolderBrowser.ShowDialog()
[string] $Jobsearchroot = $FolderBrowser.SelectedPath
$Jobsearchroot = $Jobsearchroot + '\'

#File browser to select the cover letter
$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{
  InitialDirectory = $HOME
  Filter = ' Word Docments (*.docx)|*.docx|Richtext Fomat  (*.rtf)|*.rtf|Text Document (*.txt)|*.txt'
  Title = 'Select your draft cover letter'
 }
 $FileBrowser.ShowDialog()
 [string]$draftletter = $FileBrowser.FileName
 $cleanfile = $FileBrowser.SafeFileName
 
$valid = "true"

#Save to hashtab for Json config
$newconfig = @{
    Jobsearchroot = $Jobsearchroot
    draftletter = $draftletter
    letter = $cleanfile
    valid = $valid 
}
#Store Configuration after removing the old invalid configuration
Remove-Item "$PSScriptRoot/config.json"
New-Item "$PSScriptRoot/config.json" -ItemType 'File'
ConvertTo-Json $newconfig | Set-Content "$PSScriptRoot/config.json"
}
#Load configuration
$Jobsearchroot = $config.Jobsearchroot
$coverletter = $config.draftletter
#Grab month and year 
[string] $month = (Get-Date -UFormat %b) 
[string] $year = (Get-Date).Year
$date = $year +" " + $month
#Get infomation from user
Write-Output "What's the job title?"
[String]$Jobtitle = Read-Host
#Make new directory
$Jobtitle = ($date + " - " + $Jobtitle)
$Jobdir = $Jobsearchroot + $Jobtitle + '\'
$Jobdir.ToString()
New-Item $Jobdir -ItemType 'Directory'
Copy-Item $coverletter -Destination $jobdir
$coverletter = $Jobdir + $config.letter
#Final step
Write-Output 'Opening file, good luck! :)'
Start-Sleep -Seconds 1.5
Invoke-Item $coverletter
    }
