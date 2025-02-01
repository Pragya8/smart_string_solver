# Smart String Solver (Rails Application)

## Overview
This is a simple **Rails application** implementing a **String Calculator** that can:
- Add numbers from a given string input.
- Handle different delimiters.
- Support multiple delimiters, including custom-length ones.
- Ignore numbers greater than 1000.
- Throw exceptions for negative numbers.

## Features
- Supports numbers separated by **commas (`,`)** and **new lines (`\n`)**.
- Allows custom delimiters using the format `//[delimiter]\n[numbers]`.
- Supports multiple custom delimiters, including multi-character delimiters.
- Ignores numbers greater than 1000.
- Raises an exception if negative numbers are present.

## Installation
### 1. Clone the Repository
```
git clone https://github.com/Pragya8/smart_string_solver.git
cd smart_string_solver
```

### 2. Install Dependencies
```
bundle install
```

### 3. Run the Application
```
rails server
```

## Running Tests
To run RSpec tests, execute:
```
rspec
```

## Contributing
Feel free to fork this repository and submit a pull request with improvements or bug fixes.
