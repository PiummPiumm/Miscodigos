function get-couchdb {
    param (
        [parameter(Mandatory=$true)]
        [string]$server,
        [parameter(Mandatory=$true)]
        [bool]$SSL,
        [parameter(Mandatory=$true)]
        [string]$Database,
        [parameter(Mandatory=$false)]
        [string]$file
    )

    # $auth = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("${usuario}:$password"))
    $auth = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("usuario1:user123"))
    
    $headers = @{ Authorization = "Basic $auth" }
    if($SSL){
        $protocol = 'https'
        $Port = 6984

    }else{
        $protocol = 'http'
        $Port = 5984
    }
    invoke-RestMethod -Uri "${protocol}://${server}:$Port/$Database/$file" -Method GET -Headers $headers
    Remove-Variable -Name headers
    # Remove-Variable -Name auth
}
get-couchdb -Server localhost -SSL $true -Database instalite