import os
import json

# Get user input for the root for the new files and folders to be created
jobsearchroot = None
jobsearchroot = str(jobsearchroot)
while not os.path.exists(jobsearchroot):
    jobsearchroot = input(
        "Please input the folder of your job search.\nThis is where you wish to have the cover letters and any other supporting documents stored in a directory per job basis.\nUNC Path format required.\n"
    )

# Find the draft letter location
draftcoverroot = None
draftcoverroot = str(draftcoverroot)
while not os.path.exists(draftcoverroot):
    draftcoverroot = input(
        "Please input the directory where your draft cover letter is located.\nUNC Path Required.\n"
    )

# List contents of the directory
y = 0
file_list = []
for x in os.listdir(draftcoverroot):
    i = f"{y} - {x}"
    print(i)
    y += 1
    file_list.append(i)

# Clean the list length for user selection because 0 matters
max_selection = len(file_list) - 1

# Prompt for user confirmation of which file is to be selected
draftletterselection = input(
    f"Select from the above using the number next to the file to select your Cover letter 0 - {max_selection}: "
)
draftletterselection = int(draftletterselection)
draftletter = file_list[draftletterselection]

# Sanitize the variable
cleanfilename = draftletter[4:]

# Create clean UNC
draftletterunc = f"{draftcoverroot}/{cleanfilename}"

# To be used in the future for confirmation before writing to the config file
# print(f"Job Search Root: {jobsearchroot}\nDraft Letter location: {draftletterunc}\nLetter: {cleanfilename}")

# Define config file, this will be stored with the python file
filename = "config.json"

# Declare the config data
configdata = {
    "jobsearchroot": jobsearchroot,
    "draftletterlocation": draftletterunc,
    "letter": cleanfilename,
    "status": "valid",
}


# Write the file
with open(filename, "w") as file:
    json.dump(configdata, file)
