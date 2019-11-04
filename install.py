#!/usr/bin/python


import os
import sys
import subprocess

def generate_symlinks(symlinks, dst_dir = './'):
  for (src, dst) in symlinks.items():
    dst_path = dst_dir + '/' + dst
    try:
      os.stat(dst_path)
      if os.path.isabs(src):
        os.symlink(src, dst_path)
      else:
        os.symlink('./' + src, dst_path)
    except:
      print('Symlink already exists: %s' % dst, file=sys.stderr)

dependencies = ['xdotool', 'git', 'zsh', 'tmux', 'vim', 'rofi']

print('Checking dependencies')

for dep in dependencies:
  try:
    subprocess.call(['which', dep])
  except:
    print('Dependency missing: %s' % dep, file=sys.stderr)
    sys.exit(1)

print('Loading submodules')

subprocess.call(['git', 'submodule', 'update', '--init', '--recursive'])

print('adding paths to path')

dotfiles_map = {
        'zsh':'.zshrc',
        'gitconfig': '.gitconfig',
        'tmux': '.tmux',
        'vim': '.vim',
        'npmrc': '.npmrc',
        'Xmodmap': '.Xmodmp'
}

home_dir = os.path.expanduser('~')

print('Creating symlinks for dotfiles')
generate_symlinks(dotfiles_map, home_dir)

bins_map = {
        'bins/audio-select-sink.sh': '${HOME}/.local/bin/audio-select-sink',
        'bins/resume': '${HOME}/.local/bin/resume'
}

print('creating symlinks for dotfiles')
generate_symlinks(bins_map, home_dir + '/.local/bin')

others_map = {
        '/usr/share/themes/Adwaita/gtk-2.0': 'gtkrc-2.0'
}

print('Creating symlinks for dotfiles')
generate_symlinks(others_map)

installers = ['vim', 'tmux']
print('running sub installers')
for installer in installers:
    print('Running installer for %s' % installer)
    subprocess.call([ installer + '/install.sh'])

