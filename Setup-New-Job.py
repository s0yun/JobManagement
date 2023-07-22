import os

# Get user input
jobsearchroot = None
jobsearchroot= str(jobsearchroot)
while  os.path.exists(jobsearchroot) == False:
    jobsearchroot = input("Please input the folder of your job search \nThis is where you wish to have the cover letters and any other supporting documents stored in a directory per job basis \nUNC Path format required.\n")

draftcoverroot = None
draftcoverroot= str(draftcoverroot)
while  os.path.exists(draftcoverroot) == False:
    draftcoverroot = input("Please input the directory that your draft cover letter is located \nUNC Path Required\n")



y = 0
list = []
for x in os.listdir(draftcoverroot):
    i = (f"{y} - {x}")
    print (i)
    y += 1
    list.append(i)
max = len(list) - 1
draftletterselection = input(f"Select from the above using the number next to the file to select your Cover letter 0 - {max}: ")
draftletterselection = int(draftletterselection)
draftletter = list[draftletterselection]
cleanfilename = draftletter[4:]
draftletterunc = (f"{draftcoverroot}/{cleanfilename}")

print(f"Job Search Root: {jobsearchroot} \nDraft Letter location: {draftletterunc} \nLetter: {cleanfilename}")