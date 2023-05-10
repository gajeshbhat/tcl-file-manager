import os

# Create a file with .txt extension
with open('example.txt', 'w') as f:
    f.write('This is an example text file.')

# Create a file with .md extension
with open('example.md', 'w') as f:
    f.write('# Example Markdown\n\nThis is an example markdown file.')

# Create a file with .py extension
with open('example.py', 'w') as f:
    f.write('print("Hello World!")')

# Create a file with .C extension
with open('example.C', 'w') as f:
    f.write('#include <iostream>\n\nint main() {\n    std::cout << "Hello World!" << std::endl;\n    return 0;\n}')

# Create a file with .csv extension
with open('example.csv', 'w') as f:
    f.write('Name, Age, City\nJohn, 25, New York\nJane, 30, San Francisco\n')

# Create a file with .json extension
import json
data = {'name': 'John', 'age': 25, 'city': 'New York'}
with open('example.json', 'w') as f:
    json.dump(data, f)

# Create a file with .html extension
with open('example.html', 'w') as f:
    f.write('<html>\n<head>\n<title>Example HTML</title>\n</head>\n<body>\n<h1>Example HTML</h1>\n<p>This is an example HTML file.</p>\n</body>\n</html>')

print('Files created successfully!')
