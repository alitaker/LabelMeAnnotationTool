#!/bin/bash

docker run \
--name labelme \
-p 8080:80 \
-d \
-v /usr/local/labelmeannotationtool/images:/var/www/html/LabelMeAnnotationTool/Images \
-v /usr/local/labelmeannotationtool/annotations:/var/www/html/LabelMeAnnotationTool/Annotations \
--entrypoint "/bin/bash" \
-t labelme

# restart apache inside the container
docker exec labelme service apache2 restart
