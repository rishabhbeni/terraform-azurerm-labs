# Steps to setup Git in your root folder

#Run Git command in terminal to initialize an empty directory
git init

# Run Git config command to configure username and email for Git
git config --global user.name "John Doe"
git config --global user.email "john.doe@contoso.com"

# Run Git branch commands to create a new master branch and list it
git branch master
git branch --list

# Run Git add and commit commands to commit your changes to the master branch
git status
git add .
git commit -m "updated branch"

# Create a new repository or use an existing repository to get the origin URL and then add it as remote origin
git remote add origin <URL of your Git repo>

# Push the committed changes to your remote branch
git push -u origin master