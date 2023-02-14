#!/bin/bash

arg1=$1
arg2=$2
arg3=$3
arg4=$4
arg5=$5

adDir(){
  if [ -d "$arg2/$arg3" ]
        then
                echo "Directory $arg3 already exists."
        else
                mkdir -p $arg2/$arg3
                echo "Directory $arg3 created Successfully."
        fi

        }
delDir(){
        if [ -d "$arg2/$arg3" ]
        then
                rmdir $arg2/$arg3
                echo "Directory $arg3 deleted Successfully."
        else
        echo "Directory $arg3 does not exist."
        fi
}
listAll(){
       ls -ll $arg2
 }
 listDirs(){
        find $arg2 -maxdepth 1 -type d
 }

 listFiles(){
 ls -ll $arg2
 }

 adFile(){


        if [ -f "$arg2/$arg3" ]
        then
                echo "File $arg3 already exists."
        elif [ -z $arg4 ]
        then
                touch $arg2/$arg3
                echo "File $arg3 created Successfully."
        else
                echo "$arg4" > $arg2/$arg3
                #echo $arg4
                echo "File $arg3 created Successfully."
        fi

       }

       addContentToFile(){
        echo "$arg4" >> $arg2/$arg3
        echo "Content appended to file $arg3 Successfully."
       }
        addContentToFileBegining(){
                x=`echo ${arg4}; cat $arg2/$arg3`
        echo "$x" > $arg2/$arg3
        #echo "$arg4" >> $arg2/$arg3
        echo "Content added in the begining to file $arg3 Successfully."

        }
        showFileBeginingContent(){
        head -n $arg4 $arg2/$arg3
        echo "Showing first $arg4 lines of file $arg3"
        }
        showFileEndContent(){
        tail -n $arg4 $arg2/$arg3
        echo "Showing last $arg4 lines of file $arg3"
        }
        showFileContentAtLine(){
        head -$arg4 $arg2/$arg3|tail +$arg4
        echo "Showing line no. $arg4 of file $arg3"
        }
        showFileContentForLineRange(){
        head -$arg5 $arg2/$arg3|tail +$arg4
        echo "Showing line range from $arg4 to line $arg5 of file $arg3"
        }
        moveFile(){
         mv $arg2 $arg3
        echo "File moved to path $arg3 Successfully"
        }
        copyFile(){
        cp -r $arg2 $arg3
        echo "File copied to path $arg3 Successfully"
        }
        clearFileContent(){
                echo > $arg2/$arg3
        echo "Content of file $arg3 cleared Successfully"
        }
        deleteFile(){
        if [ -f "$arg2/$arg3" ]
        then
                rm $arg2/$arg3
                echo "File $arg3 deleted Successfully."
        else
        echo "File $arg3 does not exist."
        fi
        }



case ${arg1} in
        "addDir")
        adDir
        ;;
        "deleteDir")
                delDir
                ;;
        "listAll")
                listAll
                ;;
        "listDirs")
                listDirs
                ;;
         "listFiles")
                listFiles
                 ;;
         "addFile")
        adFile
        ;;
        "addContentToFile")
                addContentToFile
                ;;
        "addContentToFileBegining")
                addContentToFileBegining
                ;;
        "showFileBeginingContent")
                showFileBeginingContent
                ;;
        "showFileEndContent")
                showFileEndContent
                ;;
        "showFileContentAtLine")
                showFileContentAtLine
                ;;
        "showFileContentForLineRange")
                showFileContentForLineRange
                ;;
        "showFileContentForLineRange")
                showFileContentForLineRange
                ;;
        "moveFile")
                moveFile
                ;;
        "copyFile")
                copyFile
                ;;
        "clearFileContent")
                clearFileContent
                ;;
        "deleteFile")
                deleteFile
                ;;
                 *)
                echo "unknown"
                  ;;
esac

