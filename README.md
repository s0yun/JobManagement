# Job Management
  
## Overview 
The `New-Job` PowerShell script helps automate the process of setting up a job application directory structure. It allows you to organize cover letters and supporting documents in a directory for each job. You can configure a root directory for all job applications, select a draft cover letter template, and generate new directories automatically for each job you apply to. 
## Features 
- Automatically organizes job application directories based on the current date, job title, and company name. 
- Prompts the user to select a cover letter template that is copied into the new job directory. - Easily configurable through a JSON file (`config.json`). 
-  Allows resetting the configuration file when needed. (PWSH only)

Keep your job search process tidy with directory for all your documents on a per application basis.

Written to run cross platform in either Python or Powershell.

## Installation

Add the module to your PowerShell Modules Directory as per [Microsoft’s Documentation](https://docs.microsoft.com/en-us/powershell/scripting/developer/module/installing-a-powershell-module?view=powershell-7.1/)

## Expectations

You have a rough cover letter that you use during applications and wish to edit. You also have a folder you wish to use as your root directory for this.

Example structure below.

  

```

# Location for the application folders to be stored, this can be made during the inital configuration.

'~/Documents/Employment/Job-Search/'

  

# Location of a Cover Letter

'~/Documents/Employment/CV and Cover Letter/'

```

## Downloads

To make it easier for you, the scripts have been organised into folders, named for their respective languages.

  
  

## Usage

### Powershell

![Static Badge](https://img.shields.io/badge/PWSH%20Version%20-%207-blue)

  

Just open PowerShell and call the module like below

```

New-Job

```

You'll be asked for the Job Title, the module will create the directory, copy your rough cover letter to this directory and open it for you.

  

During the first run you'll be asked for your directory structure and where you wish to save your applications, this is saved to a configuration file for you.

#### Parameters
If you need to regenerate the configuration (e.g., changing the root folder or cover letter template), you can run this with the `-ResetConfig` flag

    New-Job -ResetConfig


### Python

[![python](https://img.shields.io/badge/Python-3.11-3776AB.svg?style=flat&logo=python&logoColor=white)](https://www.python.org)

[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)

  

#### First use

In order to generate the configuration you'll need to run `setup_new_job.py` This will generate the required configuration file that the python script requires.

  

#### General use

To use this just run the `new_job` and follow the prompts.

  
  

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

  
  

## License

GNU General Public License v3.0
