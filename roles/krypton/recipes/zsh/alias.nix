
{
  
  # u/uu/uuu/... {{{
  u = "cd ..";
  uu = "cd ../..";
  uuu = "cd ../../..";
  uuuu = "cd ../../../..";
  uuuuu = "cd ../../../../..";
  uuuuuu = "cd ../../../../../..";
  # }}}
  
  # Git {{{

  gb = "git branch";
  
  ghub = "git clone https://github.com/$@";
  gcl = "git clone";
  git-quit = "git-abort ; git reset . ; git checkout . ; git clean -f -d";
  gzb = "git branch -l | fzf | xargs git checkout";
  gzt = "git tag -l | fzf | xargs git checkout";
  gzd = "git branch -l | fzf | xargs git branch -d";
  gzD = "git branch -l | fzf | xargs git branch -D";
  gzri =
    "git log -30 --format=oneline | fzf | cut -d ' ' -f 1 | xargs git rebase -i";

  gtl = "git tag -l";
  ga = "git add";
  gap = "git add -p";
  gaac = "git add -A .; gac";
  gav = "git commit -av";
  gbl = "git branch -l";
  gbd = "git branch -D";
  gu = "git push";
  gut = "git push --tags";
  gutf = "git push --tags -f";
  gcaar = "git add -A .; git commit -a --reuse-message=HEAD --amend";
  gcar = "git commit -a --reuse-message=HEAD --amend";
  gco = "git checkout";
  gcob = "git checkout -b";
  gcom = "gco master";
  gcp = "git cherry-pick";
  gd = "git pull";
  gf = "git diff";
  gfc = "git diff --cached";
  gl = "git log";
  glr = "git log --reverse";
  glp = "git log -p";
  glpr = "git log -p --reverse";
  gm = "git merge";
  gn = "git clone";
  gri = "git rebase -i";
  grc = "git rebase --continue";
  gra = "git rebase --abort";
  gcpa = "git cherry-pick --abort";
  gma = "git merge --abort";
  gs = "git stash";
  gsa = "git stash apply";
  gsd = "git stash drop";
  gsl = "git stash list";
  gsp = "git stash pop";
  gt = "git status -sb";
  gwc = "git whatchanged";
  gr = "git reset HEAD";
  gr1 = "git reset 'HEAD^'";
  gr2 = "git reset 'HEAD^^'";
  gro = "git reset";
  grh = "git reset --hard HEAD";
  grh1 = "git reset --hard 'HEAD^'";
  grh2 = "git reset --hard 'HEAD^^'";
  grho = "git reset --hard";
  # }}}

  less = "/usr/bin/less -FXRS";
  tmux = "/usr/bin/env TERM=screen-256color-bce tmux";
  tree = "command tree -I 'Godep*' -I 'node_modules*'";

  g = "rg";
  chx = "chmod +x";

  ctr = "ctags -R .";
  gtr = "gotags -R . > tags";

  l1 = "tree --dirsfirst -ChFL 1";
  l2 = "tree --dirsfirst -ChFL 2";
  l3 = "tree --dirsfirst -ChFL 3";
  ll1 = "tree --dirsfirst -ChFupDaL 1";
  ll2 = "tree --dirsfirst -ChFupDaL 2";
  ll3 = "tree --dirsfirst -ChFupDaL 3";
  l = "l1";
  ll = "ll1";
}
