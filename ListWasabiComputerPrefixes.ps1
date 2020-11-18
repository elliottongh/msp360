# Needs AWS CLI configured, could also be used for any S3 compatible service, I'd imagine
# ...OH HEY! There's a PowerShell AWS Tools...guess I'll need to rewrite this...later

$bucket = "yourbucket"
$endpoint = "https://s3.wasabisys.com"

$prefixes = @{}
$computers = @{}
$prefixes = $(aws s3api list-objects-v2 --bucket $bucket --delimiter "/" --endpoint-url $endpoint | ConvertFrom-Json).CommonPrefixes.Prefix
$computers = $($prefixes | ForEach { $(aws s3api list-objects-v2 --bucket $bucket --prefix $_ --delimiter "/" --endpoint-url $endpoint | ConvertFrom-Json).CommonPrefixes.Prefix })
$computers
