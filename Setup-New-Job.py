import os

# Get user input for the root for the new files and folders to be created
jobsearchroot = None
jobsearchroot= str(jobsearchroot)
while  os.path.exists(jobsearchroot) == False:
    jobsearchroot = input("Please input the folder of your job search \nThis is where you wish to have the cover letters and any other supporting documents stored in a directory per job basis \nUNC Path format required.\n")

# Find the draft letter location
draftcoverroot = None
draftcoverroot= str(draftcoverroot)
while  os.path.exists(draftcoverroot) == False:
    draftcoverroot = input("Please input the directory that your draft cover letter is located \nUNC Path Required\n")

# List contents of the directory 
y = 0
list = []
for x in os.listdir(draftcoverroot):
    i = (f"{y} - {x}")
    print (i)
    y += 1
    list.append(i)

# Clean the list length for user selection because 0 matters
max = len(list) - 1

# Prompt for user confirmation of which file is to be selected
draftletterselection = input(f"Select from the above using the number next to the file to select your Cover letter 0 - {max}: ")
draftletterselection = int(draftletterselection)
draftletter = list[draftletterselection]

# Stanitse the variable
cleanfilename = draftletter[4:]
# Create clean UNC
draftletterunc = (f"{draftcoverroot}/{cleanfilename}")

print(f"Job Search Root: {jobsearchroot} \nDraft Letter location: {draftletterunc} \nLetter: {cleanfilename}")