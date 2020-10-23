originalFile=$1
expectedExtension="@3x"
if [[ "${originalFile#*$expectedExtension.*}" != "$originalFile" ]]
then
    if [ ! -f "$originalFile" ]; then
        echo "Original image not found at : $originalFile" >&2
        exit 1
    fi
    echo "Original @3x image : $originalFile"
    sips -g pixelHeight -g pixelWidth $originalFile
    originalHeight=$(sips -g pixelHeight "$originalFile" | awk '/pixelHeight:/{print $2}')
    basicHeight=$(($originalHeight / 3))
    retinaHeight=$(($basicHeight * 2))
    retinaName=${originalFile/@3x.png/@2x.png}
    basicName=${originalFile/@3x.png/@1x.png}
    sips --resampleHeight $retinaHeight $originalFile --out $retinaName
    sips --resampleHeight $basicHeight $originalFile --out $basicName

    echo "Created 2 new files :"
    sips -g pixelHeight -g pixelWidth $retinaName
    sips -g pixelHeight -g pixelWidth $basicName
else
    echo "The original image name should end with $expectedExtension"
    exit 1
fi
