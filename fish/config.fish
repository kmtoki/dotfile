if status is-interactive
  # Commands to run in interactive sessions can go here
  function fish_prompt
      set_color purple
      echo (pwd) (set_color normal)
      echo '> '
  end

  alias e=nvim
  alias v=gvim

  set PATH "$PATH:$HOME/.local/bin"
end
