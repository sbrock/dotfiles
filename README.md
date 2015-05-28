#my dotfiiiiiiiiiiiiles

There's a conditional section in the osx .bashrc file that modifies the prompt when you're in a version controlled project. It runs a quick, VCS-specific command (svn info, git rev-parse, etc.) when switching directories and checks for a successful error code. It then modifies your prompt accordingly.

No more creating directories specifically for git, svn, and/or mercurial! No more chopping blindly into goop!

The $BASH_INCLUDES environmental variable is where static files full of exports and sources for various applications and whatnot exist. Some of these files contain sensitive information, so I don't have to worry about a .gitignore, or them getting commited somwhere the should'nt be. They're all saved to a private repo elsewhere.


