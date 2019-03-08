# PHP Switcher for Mac

## Requirements

- Homebrew
- PHP installed through brew (7.1, 7.2 and 7.3)

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

```bash
brew install php@7.3
brew install php@7.2
brew install php@7.1
```

Start the services

```
brew services start php
brew services start php@7.2
brew services start php@7.1
```

## Instructions	

- In your `.bash_profile` file create a variable called `PHP_HOME`
- Export the path: `export PATH=$PHP_HOME/bin:$PATH`
- Give the script execution permissions and then move it to you bin folder so you can execute it as a global command.

```bash
chmod +x sphp.sh
mv sphp.sh /usr/local/bin/sphp
```

## Usage

```bash
sphp 7.2
```
