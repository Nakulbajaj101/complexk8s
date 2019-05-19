echo "Welcome to the project "
echo "${PWD##*/}"
result=${PWD##*/}
for d in */; do
  echo "$d"
  echo "Creating docker file for $d"
  touch "$d"/Dockerfile
done
