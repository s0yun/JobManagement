function New-Job {
  param (
      [switch]$ResetConfig # Flag to regenerate the configuration if needed
  )

  # Required libraries
  Add-Type -AssemblyName System.Windows.Forms

  # Define configuration file path
  $configPath = "$PSScriptRoot/config.json"

  # Function to create a new configuration
  function Set-NewConfig {
      Write-Output "Creating a new configuration..."

      # Folder browser for job search directory
      $FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
      $FolderBrowser.Description = 'Select the folder for your job search. This is where cover letters and documents will be stored.'
      [void]$FolderBrowser.ShowDialog()
      [string]$Jobsearchroot = $FolderBrowser.SelectedPath
      if (-not $Jobsearchroot) {
          throw "Job search root folder selection was cancelled or is invalid."
      }
      $Jobsearchroot += '\'

      # File browser to select the draft cover letter
      $FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{
          InitialDirectory = $HOME
          Filter = 'Word Documents (*.docx)|*.docx|Rich Text Format (*.rtf)|*.rtf|Text Documents (*.txt)|*.txt'
          Title = 'Select your draft cover letter'
      }
      $FileBrowser.ShowDialog()
      [string]$draftletter = $FileBrowser.FileName
      [string]$cleanfile = $FileBrowser.SafeFileName
      if (-not $draftletter) {
          throw "Cover letter selection was cancelled or is invalid."
      }

      # Create a new config hash table
      $newconfig = @{
          Jobsearchroot = $Jobsearchroot
          draftletter  = $draftletter
          letter       = $cleanfile
          valid        = "true"
      }

      # Save new configuration to JSON file
      ConvertTo-Json $newconfig | Set-Content -Path $configPath
      Write-Output "Configuration saved successfully."
  }

  # Function to retrieve the configuration
  function Get-Config {
      try {
          return Get-Content -Path $configPath -ErrorAction Stop | ConvertFrom-Json
      } catch {
          Write-Output "Error reading configuration: $_"
          return $null
      }
  }

  # Check if configuration exists and is valid, or regenerate if flag is passed
  $config = if ($ResetConfig -or -not (Test-Path $configPath)) {
      Set-NewConfig
      Get-Config
  } else {
      Get-Config
  }

  # Ensure configuration is valid
  if (-not $config -or $config.valid -ne "true") {
      Write-Output "Invalid configuration. Regenerating..."
      Set-NewConfig
      $config = Get-Config
  }

  # Check if configuration loading failed
  if (-not $config) {
      throw "Failed to load or generate a valid configuration."
  }

  # Load configuration values
  $Jobsearchroot = $config.Jobsearchroot
  $coverletter   = $config.draftletter

  # Get current date
  [string]$month = (Get-Date -UFormat %b)
  [string]$year  = (Get-Date).Year
  $date = "$year $month"

  # Collect job information from the user
  $Jobtitle = Read-Host "What is the job title?"
  $company  = Read-Host "Company name?"

  # Create a new job directory
  $JobFolderName = "$date - $Jobtitle ($company)"
  $Jobdir = Join-Path -Path $Jobsearchroot -ChildPath $JobFolderName
  if (-not (Test-Path $Jobdir)) {
      New-Item -Path $Jobdir -ItemType Directory | Out-Null
  } else {
      Write-Output "Directory already exists: $Jobdir"
  }

  # Copy cover letter to new job directory
  Copy-Item -Path $coverletter -Destination $Jobdir

  # Build the path to the copied cover letter
  $newCoverLetterPath = Join-Path -Path $Jobdir -ChildPath $config.letter

  # Open the cover letter file for editing
  Write-Output "Opening the cover letter. Good luck!"
  Start-Sleep -Seconds 1.5
  Invoke-Item $newCoverLetterPath
}
