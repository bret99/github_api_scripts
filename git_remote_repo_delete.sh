read -p "Name the repository to DELETE: " REPO_TO_DELETE
curl -X DELETE -H 'Authorization: token YOUR_TOKEN' https://api.github.com/repos/USER_NAME/$REPO_TO_DELETE
