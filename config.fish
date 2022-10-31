alias git hub
alias weather "curl https://v2.wttr.in/u"
alias grep rg
alias c code
alias s ddgr
alias gst "git status"
alias vi nvim
set GOPATH /Users/$USER/go
set PATH $GOPATH/bin $PATH
set -gx HOMEBREW_PREFIX "/opt/homebrew";
set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set -gx HOMEBREW_REPOSITORY "/opt/homebrew";
set -gx HOMEBREW_SHELLENV_PREFIX "/opt/homebrew";
set -q PATH; or set PATH ''; set -gx PATH "/opt/homebrew/bin" "/opt/homebrew/sbin" $PATH;
set -q MANPATH; or set MANPATH ''; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
set -q INFOPATH; or set INFOPATH ''; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;
set PRDIR /Volumes/GoogleDrive/My\ Drive/prs
set TODODIR "/Users/$USER/Dropbox"
set NOTESDIR /Volumes/GoogleDrive/My\ Drive/notes
set JOURNALDIR /Users/$USER/Library/Mobile\ Documents/iCloud~posting/Documents
set PATH /usr/local/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" /Users/ylukem/.cargo/bin /Users/ylukem/.bun/bin $PATH
set PATH /opt/homebrew /opt/homebrew/bin $PATH
set EDITOR nvim


if test -e '/Users/ylukem/.nix-profile/etc/profile.d/nix.sh'
  fenv source '/Users/ylukem/.nix-profile/etc/profile.d/nix.sh'
end

ulimit -n 200000
ulimit -u 2048

abbr --add gco "git co -b ylukem/"

function flac2mp3
    for file in *.flac; ffmpeg -i "$file" -aq 0 (string replace -r '\.flac$' .mp3 $file) ; end; mkdir -p flac; mv *.flac flac
end

function todo
    vi $TODODIR/todo.md
end

function j
   echo \n\n"## ["(date +'%H:%M:%S')"]"\n\n >> $JOURNALDIR/(date +'%Y-%m-%d').md
   vi '+normal G$' +startinsert $JOURNALDIR/(date +'%Y-%m-%d').md
end

function jo
  vi $JOURNALDIR/(date +'%Y-%m-%d').md
end

function jv
  cat $JOURNALDIR/(date +'%Y-%m-%d').md
end

function newpr
    set PRFILENAME $PRDIR/(date +'%Y-%m-%d-%X').txt
    cp $PRDIR/template.txt $PRFILENAME
    vi $PRFILENAME
    cat $PRFILENAME | pbcopy
    echo "PR body copied to clipboard"
end

function todo-yesterday
    mdless $TODODIR/(date -v '-1d' +'%Y-%m-%d').md
end

function todo-tomorrow
  vi $TODODIR/(date -v '+1d' +'%Y-%m-%d').md
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

function iterm2_fish_prompt --description 'Write out the prompt'
	set -l last_status $status

    if not set -q __fish_git_prompt_show_informative_status
        set -g __fish_git_prompt_show_informative_status 1
    end
    if not set -q __fish_git_prompt_hide_untrackedfiles
        set -g __fish_git_prompt_hide_untrackedfiles 1
    end

    if not set -q __fish_git_prompt_color_branch
        set -g __fish_git_prompt_color_branch magenta --bold
    end
    if not set -q __fish_git_prompt_showupstream
        set -g __fish_git_prompt_showupstream "informative"
    end
    if not set -q __fish_git_prompt_char_upstream_ahead
        set -g __fish_git_prompt_char_upstream_ahead "↑"
    end
    if not set -q __fish_git_prompt_char_upstream_behind
        set -g __fish_git_prompt_char_upstream_behind "↓"
    end
    if not set -q __fish_git_prompt_char_upstream_prefix
        set -g __fish_git_prompt_char_upstream_prefix ""
    end

    if not set -q __fish_git_prompt_char_stagedstate
        set -g __fish_git_prompt_char_stagedstate "●"
    end
    if not set -q __fish_git_prompt_char_dirtystate
        set -g __fish_git_prompt_char_dirtystate "✚"
    end
    if not set -q __fish_git_prompt_char_untrackedfiles
        set -g __fish_git_prompt_char_untrackedfiles "…"
    end
    if not set -q __fish_git_prompt_char_conflictedstate
        set -g __fish_git_prompt_char_conflictedstate "✖"
    end
    if not set -q __fish_git_prompt_char_cleanstate
        set -g __fish_git_prompt_char_cleanstate "✔"
    end

    if not set -q __fish_git_prompt_color_dirtystate
        set -g __fish_git_prompt_color_dirtystate blue
    end
    if not set -q __fish_git_prompt_color_stagedstate
        set -g __fish_git_prompt_color_stagedstate yellow
    end
    if not set -q __fish_git_prompt_color_invalidstate
        set -g __fish_git_prompt_color_invalidstate red
    end
    if not set -q __fish_git_prompt_color_untrackedfiles
        set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
    end
    if not set -q __fish_git_prompt_color_cleanstate
        set -g __fish_git_prompt_color_cleanstate green --bold
    end

    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

    set -l color_cwd
    set -l prefix
    set -l suffix
    switch "$USER"
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix '>'
    end

    # PWD
    set_color $color_cwd
    echo -n (prompt_pwd)
    set_color normal

    if contains (basename $PWD) "pay-server"
        printf ' (%s) ' (git branch-name)
    else
        printf '%s ' (__fish_git_prompt)
    end

    if not test $last_status -eq 0
        set_color $fish_color_error
    end

    echo -n "$suffix "

    set_color normal 
    z --add "$PWD"
end


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ylukem/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/ylukem/Downloads/google-cloud-sdk/path.fish.inc'; end

# ~/.config/fish/functions/nvm.fish
function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

# ~/.config/fish/functions/nvm_find_nvmrc.fish
function nvm_find_nvmrc
  bass source ~/.nvm/nvm.sh --no-use ';' nvm_find_nvmrc
end

function nvm_get_default
  echo ~/.nvm/versions/node/v(cat ~/.nvm/alias/default)/bin
end


export PATH="$PATH:/Users/ylukem/.foundry/bin"
fish_add_path (nvm_get_default) -P


function load_nvm --on-variable="PWD"
  set -l default_node_version (nvm version default)
  set -l node_version (nvm version)
  set -l nvmrc_path (nvm_find_nvmrc)
  if test -n "$nvmrc_path"
    set -l nvmrc_node_version (nvm version (cat $nvmrc_path))
    if test "$nvmrc_node_version" = "N/A"
      nvm install (cat $nvmrc_path)
    else if test "$nvmrc_node_version" != "$node_version"
      nvm use $nvmrc_node_version
    end
  else if test "$node_version" != "$default_node_version"
    echo "Reverting to default Node version"
    nvm use default
  end
end

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

    # TokyoNight Color Palette
    set -l foreground c0caf5
    set -l selection 33467c
    set -l comment 565f89
    set -l red f7768e
    set -l orange ff9e64
    set -l yellow e0af68
    set -l green 9ece6a
    set -l purple 9d7cd8
    set -l cyan 7dcfff
    set -l pink bb9af7

    # Syntax Highlighting Colors
    set -g fish_color_normal $foreground
    set -g fish_color_command $cyan
    set -g fish_color_keyword $pink
    set -g fish_color_quote $yellow
    set -g fish_color_redirection $foreground
    set -g fish_color_end $orange
    set -g fish_color_error $red
    set -g fish_color_param $purple
    set -g fish_color_comment $comment
    set -g fish_color_selection --background=$selection
    set -g fish_color_search_match --background=$selection
    set -g fish_color_operator $green
    set -g fish_color_escape $pink
    set -g fish_color_autosuggestion $comment

    # Completion Pager Colors
    set -g fish_pager_color_progress $comment
    set -g fish_pager_color_prefix $cyan
    set -g fish_pager_color_completion $foreground
    set -g fish_pager_color_description $comment
    set -g fish_pager_color_selected_background --background=$selection


