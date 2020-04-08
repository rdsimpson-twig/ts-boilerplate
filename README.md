
# ts-boilerplate
Scripts and config to quickly setup a backend project using typescript, jest and nodemon, just run the init-project.sh and follow the prompts to create a runnable ts-node project.

## Dependencies
* nvm 

## Example usage
Create an alias in ~/.bash_rc
```alias tsnew='sh ~/github/rdsimpson-twig/ts-boilerplate/init-project.sh'```

In the project folder use the alias, fill in the standard npm init prompts
```$ tsnew ```

Start the project
```$ yarn start ```

Work on the project and see nodemon restarting on change. jest is installed and configured
