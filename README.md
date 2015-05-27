#my dotfiiiiiiiiiiiiles

The one little conditional section I like modifies your user prompt when you're in a version controlled project. It runs a quick, VCS-specific command (svn info, git rev-parse, etc) when switching directories and checks for a successful error code. It then modifies your prompt accordingly.j

No more creating directories specifically for git, svn, and/or mercurial! No more chopping blindly into goop!
