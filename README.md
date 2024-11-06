# Helios Profile for OH6A by _author
This is a profile for Helios Virtual Cockpit to support the OH6A.

# Helios Profile for _aircraft by _author
This is a profile for Helios Virtual Cockpit to support the _aircraft.

### Creating a New Profile

#### Login to GitHub

Login to the [repositories section](https://github.com/orgs/HeliosProfiles/repositories) of the HeliosProfiles account.

Press the "New Repository" button to start creating a new repository.

![image](https://github.com/HeliosProfiles/Template/assets/18526232/edc49073-6a6f-45d7-8371-7acbc0359e0d)

Make sure you select a template for the new repository, select a representative name using hyphens between words, make it private, and press "Create Repository".
![image](https://github.com/HeliosProfiles/Template/assets/18526232/82fff291-ad91-4ff9-aff5-80fe0c254714)

### Variable Substitution

The following variables appear in directory names, file names, and internally within files.  In order to resolve these variables, lines in the `env:` sextion at the start of the workflow file [InitRepo.yml](.github/workflows/InitRepo.yml) should be manually replaced with the appropriate values (as in this example). 
the required values.

```
env:
  VEHICLE: _vehicle
  VEHICLECOMMONNAME: _aircraft
  MINHELIOSRELEASE: _minheliosrelease
  PROFILENAME: _aircraft__author
  AUTHOR: _author
```

    1. _aircraft eg "F-5E"
    2. _author eg "MadKreator37"
    3. _minheliosrelease  eg 1.6.6090.0000
    4. _vehicle eg "F-5E-3"

Once the workflow has been changed, the InitRepo workflow should be run manually.

Click on **Actions**
![image](https://github.com/user-attachments/assets/6481faad-ed82-4a7c-9e10-d7f52f121179)

On the left hand side, select the InitRepo workflow
![image](https://github.com/user-attachments/assets/8e6af899-a6e5-436e-a76b-959753543d9d)

and then click the `Run Workflow` button
![image](https://github.com/user-attachments/assets/ad241b52-8807-4da3-89cf-fbceea46118b)

and then click the `Run Workflow` button which appears in the pop-up window - making sure that the branch has been set to `main` 

![image](https://github.com/user-attachments/assets/5ae016bb-4aa8-40be-a0d9-28a4b5a6e049)

## Cloning the Repository to Your local computer
Press the "Code" button, and navigate to "Local" and then "HTTPS" where you click on the "copy to clipboard" icon.

![image](https://github.com/HeliosProfiles/Template/assets/18526232/64801495-29c7-40c5-9122-32bdbf5825bc)

### Open up the "GitHub Desktop" application and navigate to "File" -> "Clone Repository"

![image](https://github.com/HeliosProfiles/Template/assets/18526232/59e05f17-a8e8-47a7-a5d5-89b7294267d6)

Select "URL" from the "Clone Repository" dialogue and paste the URL you copied from GitHub into the "Respository URL" field.
Enter the directory where you want the repo to exist on your local machine into the "Local Path" field and then press "Clone".

![image](https://github.com/HeliosProfiles/Template/assets/18526232/c536842c-ca54-45e4-a2f9-5b2b7496ed2a)

