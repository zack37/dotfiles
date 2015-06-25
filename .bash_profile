alias ls='ls -a'
alias angulardir='cd ~/Desktop/angular/public'
alias pythondir='cd ~/Desktop/python'
alias androiddir='cd ~/Desktop/android'
alias http='python -m SimpleHTTPServer'
alias bashrc='open ~/.bash_profile'
alias input='open ~/.inputrc'
export PATH=/usr/local/bin/sbt/bin:$PATH
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w -\$(parse_git_branch)\[\033[00m\] $ "
# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

code() {
  VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*
}
