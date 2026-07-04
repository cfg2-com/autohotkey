;--------------------------------------------
; https://markjacobsen.net
;
; Note: 
; :O: is for text expansion/replacement
; :X: is what causes a function to run
;
; Ref:
; https://docs.docker.com/engine/reference/commandline/docker/
;--------------------------------------------

:O:#dkopts::{
    SendInput("{#}General: dkls, dklsa, dkstopped, dkrma, dkrestarta, dkstopa, dkprune, dkstats, dksys{enter}")
    SendInput("{#}Containers: dkcrm, dkcbash, dkcrestart, dkclogtail, dkclog, dkcloguse, dkclogtrun, dkcin{enter}")
    SendInput("{#}Images: dkimg, dkimgls, dkimgprune, dkimgclean, dkimgpull, dkimgpulla{enter}")
    SendInput("{#}Volumes: dkvol, dkvolprune{enter}")
    SendInput("{#}Compose: dkcomrecreate, dkcomstart, dkcomstop, dkcomrestart{enter}")
}

:O:.dkls::sudo docker ps
:O:.dklsa::sudo docker ps -a
:O:.dkstopped::sudo docker ps --filter "status=exited"
:O:.dkps::sudo docker ps
:O:.dklist::sudo docker ps
:O:.dkrma::sudo docker rm $(sudo docker ps -a -q)
:O:.dkrestarta::sudo docker restart $(sudo docker ps -q)
:O:.dkstopa::sudo docker stop $(sudo docker ps -q)
:O:.dkprune::sudo docker system prune
:O:.dkstats::sudo docker stats
:O:.dksys::docker system df -v

;---Container commands---
:O:.dkcrm::sudo docker rm [container]
:O:.dkcbash::sudo docker exec -it [container] /bin/bash
:O:.dkcrestart::sudo docker restart [container]
:O:.dkclogtail::sudo docker logs --tail 50 --follow --timestamps [container]
:O:.dkclog::sudo docker logs -f --details [container]
:O:.dkcloguse::sudo sh -c "du -ch /var/lib/docker/containers/*/*-json.log"
:O:.dkclogtrun::sudo sh -c "truncate -s 0 /var/lib/docker/containers/*/*-json.log"
:O:.dkcin::sudo docker container inspect [container]

;---Image commands---
:O:.dkimg::sudo docker images
:O:.dkimgls::sudo docker images --format "{{.Repository}}:{{.Tag}}" | grep -v '<none>'
:O:.dkimgprune::sudo docker image prune -af
:O:.dkimgclean::sudo docker rmi $(sudo docker images --filter "dangling=true" -q --no-trunc)
:O:.dkimgpull::sudo docker pull [image]
:O:.dkimgpulla::for image in $(sudo docker images --format "{{.Repository}}:{{.Tag}}" | grep -v '<none>'); do sudo docker pull $image; done;

;---Volume commands---
:O:.dkvol::sudo docker volume ls
:O:.dkvolinfo::sudo docker volume inspect [volume]
:O:.dkvolprune::sudo docker volume prune

;---Docker Compose commands (must be in dir w docker-compose.yml file)---
:O:.dkcomrecreate::sudo docker-compose up --force-recreate --build -d
:O:.dkcomstart::sudo docker-compose up -d
:O:.dkcomstop::sudo docker-compose down
:O:.dkcomrestart::sudo docker-compose restart