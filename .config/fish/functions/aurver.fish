function aurver --wraps='pacman -Qm|aur vercmp' --description 'alias aurver pacman -Qm|aur vercmp'
  pacman -Qm|aur vercmp $argv
        
end
