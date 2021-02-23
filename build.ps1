param ( 
    [Parameter(Mandatory=$true)]
    [string]
    $CONTAINER_LABEL
)

Write-Host "Building the image" -ForegroundColor Cyan
docker build -t "$($CONTAINER_LABEL):latest" .