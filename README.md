# Bookmarks Sharing App 

Welcome to My Bookmarks Application! This application is a bookmark manager where users can create an account and add bookmarks the database, tags can be assigned to bookmarks and bookmarks can be filtered by tag.



## Installation
  
  * Clone the repository from Github
    >* there should be an .env.example file included in the directory.
    >* You need to create a .env file with your github app keys.
    >* should look like this: 
    ```
    GITHUB_CLIENT_ID = 23efs3ecfdsf
    GITHUB_CLIENT_SECRET = 23rfe23rf23r23r23r
    ```
    
     >* Here is a [Link](https://docs.github.com/en/developers/apps/building-oauth-apps/creating-an-oauth-app) to a guide on how to create key for an oauth application on github. by github.
    >* Your Homepage url should be set to: http://localhost:3000/
    >* Your Authorization callback url should be set to: http://localhost:3000/auth/github/callback
  * run the following command in the terminal:
    ``` bundle install```
    ```rails db:migrate```
  * To run the Server in the terminal
  ``` rails s```
  * Follow the route printeted out in the terminal or go to http://localhost:3000/ in your browser.
  * that should be everything you need to get started.

## Constributing
  Bugs reports and pull requests are welcome!

## License
  All of the Gem code used in this project is licensed under the [MIT License](https://opensource.org/licenses/MIT).

## Version
  this project is using rails 6.1.4