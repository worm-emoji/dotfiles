alias git hub
alias grep rg
alias c code
alias gst "git status"
set GOPATH /Users/ylukem/go
set PATH $GOPATH $PATH
set PRDIR /Volumes/GoogleDrive/My\ Drive/prs
set TODODIR /Volumes/GoogleDrive/My\ Drive/todo
set NOTESDIR /Volumes/GoogleDrive/My\ Drive/notes
set PATH /Users/ylukem/stripe/henson/bin /Users/ylukem/stripe/space-commander/bin /Users/ylukem/stripe/password-vault/bin /Users/ylukem/.rbenv/bin /Users/ylukem/.rbenv/shims /Users/ylukem/stripe/henson/bin /usr/local/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin /usr/local/MacGPG2/bin /usr/local/munki "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" $PATH

abbr --add g git

function todo
    vi $TODODIR/(date +'%Y-%m-%d').txt
end

function newpr
    set PRFILENAME $PRDIR/(date +'%Y-%m-%d-%X').txt
    cp $PRDIR/template.txt $PRFILENAME
    vi $PRFILENAME
    cat $PRFILENAME | pbcopy
    echo "PR body copied to clipboard"
end

function todo-yesterday
    mdless $TODODIR/(date -v '-1d' +'%Y-%m-%d').txt
end

function todo-tomorrow
  vi $TODODIR/(date -v '+1d' +'%Y-%m-%d').txt
end

function f
  fzf | read -l result; and code $result
end

alias t todo


test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

function embiggen
    sed \
        -e 's/\([a-zA-Z]\)/:big-\1:/g' \
        -e 's/0/:zero:/g' \
        -e 's/1/:one:/g' \
        -e 's/2/:two:/g' \
        -e 's/3/:three:/g' \
        -e 's/4/:four:/g' \
        -e 's/5/:five:/g' \
        -e 's/6/:six:/g' \
        -e 's/7/:seven:/g' \
        -e 's/8/:eight:/g' \
        -e 's/9/:nine:/g' \
        | tr '[:upper:]' '[:lower:]'
end
