# Load the tcltest package
package require tcltest

# Load the fileutil package
package require fileutil

# Source the code that we want to test
source "../file_manager.tcl"
source "../lib/wapp/wapp.tcl"
source "../lib/wapp/wapp-routes.tcl"

# Define a test suite
namespace eval ::file_manager_test {
    namespace export test_render_file_manager
}

proc ::file_manager_test::test_render_file_manager {args} {
    # Create a temporary directory for testing
    set test_dir [fileutil::tempdir]

    # Create some files and directories in the test directory
    fileutil::touch [file join $test_dir "file1.txt"]
    fileutil::mkdir [file join $test_dir "dir1"]
    fileutil::touch [file join $test_dir "dir1" "file2.txt"]

    # Call the render_file_manager procedure
    set content [render_file_manager $test_dir]

    # Verify that the rendered content is correct
    set expected_content "<h1>File Manager</h1><ul><li><a href=\"/?file=%2F${test_dir}%2Fdir1%2F\">dir1/</a></li><li><a href=\"/file?file=%2F${test_dir}%2Ffile1.txt\">file1.txt</a></li></ul>"
    tcltest::assertEqual $expected_content $content

    # Clean up the temporary directory
    fileutil::rm -rf $test_dir
}

# Run the test suite
tcltest::runTests ::file_manager_test
