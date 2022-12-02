# Putting it All Together: Client-Server Communication

## Learning Goals

- Understand how to communicate between client and server using fetch, and how
  the server will process the request based on the URL, HTTP verb, and request
  body
- Debug common problems that occur as part of the request-response cycle

## Introduction

Just like the last lesson, we've got code for a React frontend and Rails API
backend set up. This time though, it's up to you to use your debugging skills to
find and fix the errors!

To get the backend set up, run:

```console
$ bundle install
$ rails db:migrate db:seed
$ rails s
```

Then, in a new terminal, run the frontend:

```console
$ npm install --prefix client
$ npm start --prefix client
```

Confirm both applications are up and running by visiting
[`localhost:4000`](http://localhost:4000) and viewing the list of toys in your
React application.

## Deliverables

In this application, we have the following features:

- Display a list of all the toys
- Add a new toy when the toy form is submitted
- Update the number of likes for a toy
- Donate a toy to Goodwill (and delete it from our database)

The code is in place for all these features on our frontend, but there are some
problems with our API! We're able to display all the toys, but the other three
features are broken.

Use your debugging tools to find and fix these issues.

There are no tests for this lesson, so you'll need to do your debugging in the
browser and using the Rails server logs and `byebug`.

**Note**: You shouldn't need to modify any of the React code to get the
application working. You should only need to change the code for the Rails API.

As you work on debugging these issues, use the space in this README file to take
notes about your debugging process. Being a strong debugger is all about
developing a process, and it's helpful to document your steps as part of
developing your own process.

## Your Notes Here

- Add a new toy when the toy form is submitted

  - How I debugged: 
    - Got an error message: 500 (Internal Server Error)
    - Looked at Rails server logs in the terminal and noticed a NameError
    - Edited Toys to Toy, since we are only editing one toy with create

- Update the number of likes for a toy

  - How I debugged:
    - Got an error message: Uncaught (in promise) SyantaxError: Unexpected end of JSON input
    - React shows it was coming from our fetch request as part of the promise chain, expecting the server to return a string of JSON-formatted data, however server wasn't returning anything. 
    - So i edited my update action with if/else statement, created a custom patch route in my routes.rb, and in my toys_controller added increment_likes action. 
    - Also added show action, and included show in my resources

- Donate a toy to Goodwill (and delete it from our database)

  - How I debugged:
    - Got a 404 (Not Found) ActionController::RoutingError (No route matches [DELETE])
    - In routes.rb within resources added :destroy
    - My toys_controller had a destroy action, no changes necessary there.
