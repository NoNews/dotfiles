# Common shell functions

compu() {
  if [ -z "$1" ]; then
    echo "Usage: compu \"your commit message\""
    return 1
  fi
  git add .
  git commit -m "$1"
  git push
}
