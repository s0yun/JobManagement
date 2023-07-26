# Job Management

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
