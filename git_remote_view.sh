git_repos_short_viewer(){
    read -p "Enter the Github user name: " USER_NAME
    curl -i -s https://api.github.com/users/$USER_NAME/repos | grep "ssh_url"
}

git_repos_extended_viewer(){
    read -p "Enter the Github user name: " USER_NAME
    curl -i -s https://api.github.com/users/$USER_NAME/repos 
}

git_repo_items_extended_viewer(){
    read -p "Enter the Github user name: " USER_NAME
    read -p "Enter the repository name: " REPO_NAME
    INIT_COMMAND="curl -s -H 'Accept: application/vnd.github.v3+json' https://api.github.com/repos/$USER_NAME/$REPO_NAME/contents"
    $INIT_COMMAND
    read -p "Enter the next $REPO_NAME's item to see more info: " REPO_NAME_ITEM1
    if [ "$REPO_NAME_ITEM1" == "" ]
    then exit 
    else curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/$USER_NAME/$REPO_NAME/contents/$REPO_NAME_ITEM1 
    fi 
    read -p "Enter the next $REPO_NAME's item to see more info: " REPO_NAME_ITEM2
    if [ "$REPO_NAME_ITEM2" == "" ]
    then exit 
    else curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/$USER_NAME/$REPO_NAME/contents/$REPO_NAME_ITEM1/$REPO_NAME_ITEM2 
    fi 
    read -p "Enter the next $REPO_NAME's item to see more info: " REPO_NAME_ITEM3
    if [ "$REPO_NAME_ITEM3" == "" ]
    then exit 
    else curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/$USER_NAME/$REPO_NAME/contents/$REPO_NAME_ITEM1/$REPO_NAME_ITEM2/$REPO_NAME_ITEM3 
    fi 
    read -p "Enter the next $REPO_NAME's item to see more info: " REPO_NAME_ITEM4
    if [ "$REPO_NAME_ITEM4" == "" ]
    then exit 
    else curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/$USER_NAME/$REPO_NAME/contents/$REPO_NAME_ITEM1/$REPO_NAME_ITEM2/$REPO_NAME_ITEM3/$REPO_NAME_ITEM4 
    fi 
    read -p "Enter the next $REPO_NAME's item to see more info: " REPO_NAME_ITEM5
    if [ "$REPO_NAME_ITEM5" == "" ]
    then exit 
    else curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/$USER_NAME/$REPO_NAME/contents/$REPO_NAME_ITEM1/$REPO_NAME_ITEM2/$REPO_NAME_ITEM3/$REPO_NAME_ITEM4/$REPO_NAME_ITEM5
    fi 
} 

echo "Usage: [option]
     -s   shows public github repos in short list
     -e   shows public github repos in extended json format
     -i   shows defined public github repo items in json format (5 parsing levels)"  

read -p "Enter the option: " OPTION
if [ "$OPTION" == "-s" ]
then git_repos_short_viewer 
elif [ $OPTION == "-e" ]
then git_repos_extended_viewer 
elif [ $OPTION == "-i" ]
then git_repo_items_extended_viewer 
else echo -e "\033[1;91mWrong option!" && exit
fi

