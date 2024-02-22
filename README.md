# robotFrameworkDemo
robot frameowrk demo 
Through this project i am doing poc to use this technology at my organization.
this project is not about the proper project structure or using the best xpath or css but about looking at the benefit of using this technology for automation according to the needs of the org.

1. after pulling the branch do pip install -r requirements.txt to get all dependencies.
2. install plugins intellibot @seleniumLibrary#patched and robot framework language server
3. add *.robot to robot file of your choice in settings>editor>file types.
5. use data.yaml file to store passwords and important organization information  and add all yaml files to gitignore.
6. add all *.idea files which are for project specifications to gitignore
7. use the chromedriver version suitable for your chrome version , store it in Drivers directory which should be present at root level and added to .gitignore
8. take the chromedriver and put it at the base interpreter folder inside scripts folder
9. run command robot -d log testcasename.robot to store output fiels in log directory
10. use page object model to structure and create files and keywords.
11. connect with me for further setup.

