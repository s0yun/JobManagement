import json
import datetime
import os
import shutil

# Load the configuration from the file defined.
try:
    with open("config.json", "r") as file:
        config = json.load(file)
except FileNotFoundError:
    raise FileNotFoundError("Config file not found. \nPlease run Setup")
except json.JSONDecodeError:
    raise ValueError("Invalid JSON format in the config file. \nPlease run Setup")

if "status" not in config or config["status"] != "valid":
    raise ValueError("Invalid config. \nRerun Setup")

# Get the current date and time
current_date = datetime.datetime.now()
# Format the current date as "Month Year" string
current_month_and_year = current_date.strftime("%B %Y")
jobname = input("What's the job title? ")
companyname = input("Company name? ")

# Create file paths for the application and cover letter for job application
jobapplicationpath = (
    f"{config['jobsearchroot']}/{current_month_and_year} - {jobname} ({companyname})"
)
coverletter = f"{jobapplicationpath}/{config['letter']}"

# Create directory and then copy the file over and open it.
try:
    os.mkdir(jobapplicationpath)
    shutil.copy2(config["draftletterlocation"], coverletter)
    os.system(r"open '" + coverletter + "'")
except:
    print("An error occurred")
