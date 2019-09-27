#!/usr/bin/env bash

# create script to find current git branch
cat > /usr/bin/parse_git_branch << EOF
git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
EOF

chmod +x /usr/bin/parse_git_branch

if ! grep PS1 /root/.bashrc; then
cat >> /root/.bashrc << EOF
export PS1="[\u@\h \[\033[32m\]\w\[\033[33m\]\\\$(parse_git_branch)\[\033[00m\]]\n# ";
EOF
fi

if ! grep PS1 /home/vagrant/.bashrc; then
cat >> /home/vagrant/.bashrc << EOF
export PS1="[\u@\h \[\033[32m\]\w\[\033[33m\]\\\$(parse_git_branch)\[\033[00m\]]\n\\$ ";
EOF
fi