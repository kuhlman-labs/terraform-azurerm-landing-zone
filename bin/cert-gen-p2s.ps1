$cert = New-SelfSignedCertificate -Type Custom -KeySpec Signature `
-Subject "CN=${root_cert_name}" -KeyExportPolicy Exportable `
-HashAlgorithm sha256 -KeyLength 2048 `
-CertStoreLocation "Cert:\CurrentUser\My" -KeyUsageProperty Sign -KeyUsage CertSign

New-SelfSignedCertificate -Type Custom -DnsName P2SChildCert -KeySpec Signature `
-Subject "CN=${child_cert_name}" -KeyExportPolicy Exportable `
-HashAlgorithm sha256 -KeyLength 2048 `
-CertStoreLocation "Cert:\CurrentUser\My" `
-Signer $cert -TextExtension @("2.5.29.37={text}1.3.6.1.5.5.7.3.2")


$rootCertificate = Get-ChildItem -Path cert:\CurrentUser\My\ | where { $_.subject -eq "CN=${root_cert_name}" } 
$childCertificate = Get-ChildItem -Path cert:\CurrentUser\My\ | where { $_.subject -eq "CN=${child_cert_name}" } 

Export-Certificate -Cert $rootCertificate -FilePath "${file_path}/${root_cert_name}.cer"
Export-Certificate -Cert $childCertificate -FilePath "${file_path}/${child_cert_name}.cer"