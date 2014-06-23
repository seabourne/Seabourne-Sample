# Seabourne Coding Exercise

## Getting Started

You'll need to install the dependencies first -

### Requires Node.js v0.10

This was built using v0.10.28. To download, grab it here:

[http://nodejs.org/download/](http://nodejs.org/download/)

### Requires MongoDB 2+ installed

Install with package of your choice e.g.:
  
#### Some Linux distros:
`sudo apt-get install mongodb`
  
#### Using homebrew on Mac:
    
`brew install mongodb`
  
#### Or Download binary and install manually:
[http://www.mongodb.org/downloads](http://www.mongodb.org/downloads)   
    
### Checkout Git repository

`git clone https://github.com/seabourne/coding-exercise`

#### Gittin' Git

If you need git:

[http://git-scm.com/downloads](http://git-scm.com/downloads)

### Install the App

Once all of your dependencies are installed and you've cloned the repository, run the following command in the root of the project:
 
 `npm install`

## Running The App

From the root of the project:

`grunt`

Once running, the UI is accessible at:

[http://localhost:3000](http://localhost:3000)

### TDD

While the server is running, modifications to the server's source code or its tests will trigger the tests for the application.

To run the tests and watch for changes without running the server, you can also run:

`grunt test:server`
 
## Fixing A Bug

The tests fail right now, please see the test descriptions and output for errors

## Tasks -

1. Make the LogEntry API set the created_at attribute on newly created LogEntry's
2. Make the LogEntry API return a list of LogEntry's in descending order, ordered by created_at
3. Make the UI return focus to the text input box after a new log entry is created
