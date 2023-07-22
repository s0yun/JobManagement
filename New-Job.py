import json

file_name = "config.json"

# Reading JSON data from the file and loading it into a Python dictionary
with open(file_name, "r") as file:
    data = json.load(file)

print("Loaded data:", data)

# jobname = input("What's the job title?")
# companyname = input("Company name?")

print(data["JobSearchRoot"])


jobapplicationpath = (f"")