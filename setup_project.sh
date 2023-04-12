#! /bin/bash

# --------------------------------------------- Variable Declaration -----------------------------------------------------

DIR_NAME=$1
FILE_NAME="$DIR_NAME.js"
TEST_FILE_NAME="$DIR_NAME-test.js"
OBJ_NAME=$(echo "$DIR_NAME" | sed "s/-/_/g")
DEMO_STRUCTURE_PATH="/Users/milan18102002/workspace/nodeJS/libraryJS/demo-project-structure/"

# --------------------------------------- Creating Project Directory ----------------------------------------------------

mkdir $DIR_NAME
cd $DIR_NAME

# -------------------------------------- Creating Directory Structure ----------------------------------------------------

mkdir "lib" "src" "test"

#----------------------------------- Creating runtest.sh for Current Project ---------------------------------------------

cp "$DEMO_STRUCTURE_PATH/runtest.sh" .
sed -i "" "s/file-name-test.js/$TEST_FILE_NAME/g" runtest.sh

# --------------------------------- Loading testing.js for Current Project ----------------------------------------------

cp  "$DEMO_STRUCTURE_PATH/lib/testing.js" "lib/."

# ---------------------------------- Creating Source File with Dummy Function --------------------------------------------

cat "$DEMO_STRUCTURE_PATH/src/file-name.js" > "src/$FILE_NAME"

# ----------------------------------- Creating Test File with Dummy Test ------------------------------------------------

cat "$DEMO_STRUCTURE_PATH/test/file-name-test.js" > "test/$TEST_FILE_NAME"
sed -i "" "s/file-name/$DIR_NAME/g" "test/$TEST_FILE_NAME"
sed -i "" "s/object-name/$OBJ_NAME/g" "test/$TEST_FILE_NAME"

# ---------------------------------------- Runing Test For Test ---------------------------------------------------------

node "test/$TEST_FILE_NAME"

# -------------------------------- Initilizing and Commiting in Git -----------------------------------------------------

git init 1> /dev/null 
echo ".*.swp" 1> .gitignore
git add "lib/" "runtest.sh" "src/" "test/" ".gitignore"
git commit -m "Setup Project" 1> /dev/null
