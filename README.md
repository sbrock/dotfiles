#my dotfiiiiiiiiiiiiles

Oh look another dotfile repo!

There's a conditional section in the .bashrc file that modifies the prompt when you're in a version controlled project. It runs a quick, VCS-specific command (svn info, git rev-parse, etc.) when switching directories and checks for a successful error code. It then modifies your prompt accordingly.

There's also a section for "bash includes" that can be placed in a .bashrc.d directory with a .inc extension. This helps keep bashrc manageable in size as well as making it modular and less user-specific (read: info like Github tokens)

