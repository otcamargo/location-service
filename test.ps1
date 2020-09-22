Clear-Host

Write-Host "[1] build image"
Write-Host "[2] start container"
Write-Host "[3] delete image"

$Input = Read-Host 

if ($input -eq 1) {
  docker image build -t location-service:1.0 .
  docker run -t -d -P location-service:1.0
  $Container_name = docker ps --format '{{.Names}}'
  Write-Host ""
  Write-Host "Connecting to: $Container_name"
  docker exec -it $Container_name /bin/bash
  Write-Host "docker exec -it $Container_name /bin/bash"
}
elseif ($input -eq 2) {
  docker run -t -d -P location-service:1.0
  $Container_name = docker ps --format '{{.Names}}'
  Write-Host ""
  Write-Host "Connecting to: $Container_name"
  docker exec -it $Container_name /bin/bash
}
elseif ($input -eq 3) {
  $Container_id=docker ps --format '{{.ID}}'
  Write-Host $Container_id
  docker stop $Container_id
  Write-Output Y | docker system prune -a
}
else {
  Write-Host "Invalid"
}