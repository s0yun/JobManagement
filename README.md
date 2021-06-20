# Job Management

Keep your job search process tidy with directory for all your documents on a per application basis.

## Installation

Add the module to your PowerShell Modules Directory as per [Microsoft’s Documentation](https://docs.microsoft.com/en-us/powershell/scripting/developer/module/installing-a-powershell-module?view=powershell-7.1/) 

## Expectations

You have a rough cover letter that you use during applications and wish to edit. You also have a folder you wish to use as your root directory for this. 

Example structure below.

```
# Location for the application folders to be stored
'~/Documents/Employment/Job-Search/'

# Location of a Cover Letter
'~/Documents/Employment/CV and Cover Letter/'
```

## Usage

Just open PowerShell and call the module like below 
```PowerShell
NewJob
```
You'll be asked for the Job Title, the module will create the directory, copy your rough cover letter to this directory and open it for you. 

During the first run you'll be asked for your directory structure and where you wish to save your applications, this is saved to a configuration file for you. 

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
GNU General Public License v3.0 
