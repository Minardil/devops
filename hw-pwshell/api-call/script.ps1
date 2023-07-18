Function Get-Petrol-Price {
    $country=$args[0]
    if ($country) {
        Write-Host "Selected country: ${country}"
    }
    $headers=@{}
    $headers.Add("X-RapidAPI-Key", "2b76ca1ff1msh912382f03f5115dp1215c9jsn35897d71d08a")
    $headers.Add("X-RapidAPI-Host", "gas-price.p.rapidapi.com")
    $response = Invoke-RestMethod -Uri 'https://gas-price.p.rapidapi.com/europeanCountries' -Method GET -Headers $headers | ConvertTo-Json -Depth 10 | ConvertFrom-Json | Select-Object -Expand results

    if ($country) {
        return $response | Where-Object { $_.country –ieq $country }
    } else {
        return $response
    }
}