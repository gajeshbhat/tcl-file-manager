# TCL Web-Based File Manager

This project is a web-based file manager built in TCL. It uses the `wapp` package for handling HTTP requests and rendering HTML.

## Dependencies

This project requires the following TCL packages:

- `wapp`: This is a minimalistic framework for building web applications in TCL.
- `fileutil`: This package provides a set of file utilities for TCL, like reading files, writing files, etc.

You need to ensure these packages are installed and accessible in your TCL environment.

## Functions

The main functions in this application are:

- `render_file_manager`: This function takes a directory path as input and generates an HTML view that lists all the files and directories inside the input directory. Each file and directory in the list is a hyperlink that, when clicked, will display the content of the file or list the subdirectory.

- `wapp-default`: This function is triggered when the web application receives a request. Depending on the request's `file` parameter, it either displays the file's content, shows the file/directory listing, or displays a "File Not Found" error message.

## Running the Application

To start the web application, you just need to execute the TCL script. The `wapp-start` command at the end of the script takes care of launching the web application.

## Security Note

The script does not validate user input, which makes it potentially vulnerable to directory traversal attacks. It's important to always validate user input and consider the security implications before running a script like this in a production environment.
