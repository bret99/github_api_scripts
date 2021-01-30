import os

pre_command = "curl -H 'Authorization: token YOUR_TOKEN' https://api.github.com/user/repos -d '"
str_to_add_1 = '{"name":"'
REPO_NAME = input("Name the repository to CREATE: ")
REPO_DESCRIPTION = input("The repository description: ")
REPO_TYPE = input("Is your repository private [true/false]: ")
str_to_add_2 = REPO_NAME + '", "description":"' + REPO_DESCRIPTION + '", "private":' + REPO_TYPE + "}'"
os.system(pre_command + str_to_add_1 + str_to_add_2)

