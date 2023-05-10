#!/usr/bin/env tclsh

source "lib/wapp/wapp.tcl"
source "lib/wapp/wapp-routes.tcl"

# Load the fileutil package
package require fileutil

# Render the file manager UI
proc render_file_manager {path} {
    set files [glob -nocomplain -directory $path *]

    set content "<h1>File Manager</h1>"
    append content "<ul>"

    foreach file $files {
        set filename [file tail $file]
        set url "file=[string map { % %25 / %2F } $file]"
        if {[file isdirectory $file]} {
            append content "<li><a href=\"/?$url\">$filename/</a></li>"
        } else {
            append content "<li><a href=\"/file?$url\">$filename</a></li>"
        }
    }
    append content "</ul>"

    return $content
}

# Update the wapp-default procedure
proc wapp-default {} {
    set path [wapp-param file .]

    if {[file isfile $path]} {
        set content [fileutil::cat $path]
        wapp-subst "<pre>$content</pre>"
    } elseif {[file isdirectory $path]} {
        set content [render_file_manager $path]
        wapp-subst $content
    } else {
        set content "<h1>File Not Found</h1>"
        wapp-subst $content
    }
}

wapp-start $argv