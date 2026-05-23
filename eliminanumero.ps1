Get-ChildItem -Path . -Filter *.html -Recurse -File | ForEach-Object {
    $content = Get-Content $_.FullName -Raw
    $clean = $content -replace '(?s)<p>[0-9a-fA-F]+\s*</p>', ''
    Set-Content $_.FullName $clean -NoNewline
}