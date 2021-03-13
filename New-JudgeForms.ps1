$Headers = "Timestamp","EmailAddress","StudentFirstName","StudentLastName","StudentYearsofStudy","InstrumentEvent","Class1","TotalAuditionTiming1","RequiredCompositionTitle1","RequiredCompositionComposer1","ScanofRequiredpiece1","Studentperformancevideo1","ChoicepieceTitle1","ChoicepieceComposer1","ScanofChoicepiece1","VideoofChoicePiece1","Class2","TotalAuditionTiming2","RequiredCompositionTitle2","RequiredCompositionComposer2","ScanofRequiredPiece2","VideoofRequiredPiece2","ChoiceCompositionTitle2","ChoiceCompositionComposer2","ScanofChoicepiece2","VideoofChoicepiece2","Class3","TotalAuditionTiming3","RequiredCompositionTitle3","RequiredCompositionComposer3","ScanofRequiredpiece3","VideoofRequiredpiece3","ChoicePieceTitle3","ChoicePieceComposer3","ScanofChoicepiece3","VideoofChoicepiece3","Class4","TotalAuditionTiming4","RequiredCompositionTitle4","RequiredCompositionComposer4","ScanofRequiredpiece4","VideoofRequiredPiece4","ChoicePieceTitle4","ChoicePieceComposer4","ScanofChoicepiece4","VideoofChoicePiece4","Class5","AccompanistName5","Title5","Composer5","Timing5","Scanofrepertoire5","StudentPerformancevideo5","Class6","Timing6","RequiredPieceTitle6","RequiredPieceComposer6","ScanofRequiredpiece6","StudentPerformancevideo61","Choicepiecetitle6","ChoicepieceComposer6","ScanofChoicepiece6","Studentperformancevideo62","Accompanistname6","Class7","RequiredpieceTitle7","RequiredPieceComposer7","ScanofRequiredpiece71","VideoofRequiredPiece7","ScanofRequiredpiece72","3rdStatepieceTitle7","3rdStatepiececomposer7","Scanof3rdStatepiece7","Videoof3rdStatepiece7","blank1","blank2","blank3","blank4","blank5","blank6","Judge"

$csv = Import-Csv '.\3_13 Festival Judging - Sheet1.csv' -Header $Headers
$csv = $csv | Sort-Object StudentFirstName,StudentLastName

$csv | % {

if($_.EmailAddress -ne "Email Address"){
$Html = @"
<!DOCTYPE html>
<html>
<head>
<style>
table {
  border-collapse: collapse;
  table-layout: auto;
  width: 200;
}
td{
padding: 6px;
font-size: 18px;
font-family: Georgia, serif;
}
</style>
</head>
<body>
"@
$StudentName = "$($_.Judge)-$($_.StudentFirstName.Trim())$($_.StudentLastName.Trim())"

$Table = "<table>`r`n"
$Table += "<tr>`r`n"
$Table += "<td colspan='2'><strong>Student Name</strong><br />$($_.StudentFirstName) $($_.StudentLastName)</td>`r`n"
$Table += "<td colspan='1'><strong>Years of Study</strong><br />$($_.StudentYearsofStudy)</td>`r`n"
$Table += "<td colspan='2'><strong>Instrument/Event</strong><br />$($_.InstrumentEvent)</td>`r`n"
$Table += "</tr>`r`n"
if($_.Class1){
$Filename = "$StudentName-$($_.Class1).html"
$Table += "<tr>`r`n"
$Table += "<td><strong>Event</strong><br />$($_.Class1)</td>`r`n"
$Table += "<td><strong>Timing</strong><br />$($_.TotalAuditionTiming1)</td>`r`n"
$Table += "<td><strong>Title (Required)</strong><br />$($_.RequiredCompositionTitle1)</td>`r`n"
$Table += "<td><strong>Composer (Required)</strong><br />$($_.RequiredCompositionComposer1)</td>`r`n"
if(($_.ScanofRequiredpiece72 -split ", ").count -gt 1){
$split = $_.ScanofRequiredpiece72 -split ", "
$i=0
$Table += "<td>"
$split | % {
$i++
$Table += " <a target='_new' href='$($_)'>Scan (Required) $i</a>"
}
$Table += "</td>"
} else {
$Table += "<td><a target='_new' href='$($_.ScanofRequiredpiece72)'>Scan (Required)</a></td>`r`n"
}
$Table += "</tr>`r`n"
$Table += "<tr>`r`n"
$Table += "<td><a target='_new' href='$($_.Studentperformancevideo1)'>Video (Performance)</a></td>`r`n"
$Table += "<td><strong>Title</strong><br />$($_.ChoicepieceTitle1)</td>`r`n"
$Table += "<td><strong>Composer</strong><br />$($_.ChoicepieceComposer1)</td>`r`n"
if(($_.ScanofChoicepiece1 -split ", ").count -gt 1){
$split = $_.ScanofChoicepiece1 -split ", "
$i=0
$Table += "<td>"
$split | % {
$i++
$Table += " <a target='_new' href='$($_)'>Scan (Choice) $i</a>"
}
$Table += "</td>"
} else {
$Table += "<td><a target='_new' href='$($_.ScanofChoicepiece1)'>Scan (Choice)</a></td>`r`n"
}
if(($_.VideoofChoicePiece1 -split ", ").count -gt 1){
$split = $_.VideoofChoicePiece1 -split ", "
$i=0
$Table += "<td>"
$split | % {
$i++
$Table += " <a target='_new' href='$($_)'>Video (Choice) $i</a>"
}
$Table += "</td>"
} else {
$Table += "<td><a target='_new' href='$($_.VideoofChoicePiece1)'>Video (Choice)</a><br /></td>`r`n"
}
$Table += "</tr>`r`n"
}
if($_.Class2){
$Filename = "$StudentName-$($_.Class2).html"
$Table += "<tr>`r`n"
$Table += "<td><strong>Event</strong><br />$($_.Class2)</td>`r`n"
$Table += "<td><strong>Timing</strong><br />$($_.TotalAuditionTiming2)</td>`r`n"
$Table += "<td><strong>Title (Required)</strong><br />$($_.RequiredCompositionTitle2)</td>`r`n"
$Table += "<td><strong>Composer (Required)</strong><br />$($_.RequiredCompositionComposer2)</td>`r`n"
if(($_.ScanofRequiredPiece2 -split ", ").count -gt 1){
$split = $_.ScanofRequiredPiece2 -split ", "
$i=0
$Table += "<td>"
$split | % {
$i++
$Table += " <a target='_new' href='$($_)'>Scan (Required) $i</a>"
}
$Table += "</td>"
} else {
$Table += "<td><a target='_new' href='$($_.ScanofRequiredPiece2)'>Scan (Required)</a></td>`r`n"
}
$Table += "</tr>`r`n"
$Table += "<tr>`r`n"
$Table += "<td><a target='_new' href='$($_.VideoofRequiredPiece2)'>Video (Required)</a></td>`r`n"
$Table += "<td><strong>Title (Choice)</strong><br />$($_.ChoiceCompositionTitle2)</td>`r`n"
$Table += "<td><strong>Composer (Choice)</strong><br />$($_.ChoiceCompositionComposer2)</td>`r`n"
if(($_.ScanofChoicepiece2 -split ", ").count -gt 1){
$split = $_.ScanofChoicepiece2 -split ", "
$i=0
$Table += "<td>"
$split | % {
$i++
$Table += " <a target='_new' href='$($_)'>Scan (Choice) $i</a>"
}
$Table += "</td>"
} else {
$Table += "<td><a target='_new' href='$($_.ScanofChoicepiece2)'>Scan (Choice)</a></td>`r`n"
}
if(($_.VideoofChoicepiece2 -split ", ").count -gt 1){
$split = $_.VideoofChoicepiece2 -split ", "
$i=0
$Table += "<td>"
$split | % {
$i++
$Table += " <a target='_new' href='$($_)'>Video (Choice) $i</a>"
}
$Table += "</td>"
} else {
$Table += "<td><a target='_new' href='$($_.VideoofChoicepiece2)'>Video (Choice)</a></td>`r`n"
}
$Table += "</tr>`r`n"
}
if($_.Class3){
$Filename = "$StudentName-$($_.Class3).html"
$Table += "<tr>`r`n"
$Table += "<td><strong>Event</strong><br />$($_.Class3)</td>`r`n"
$Table += "<td><strong>Timing</strong><br />$($_.TotalAuditionTiming3)</td>`r`n"
$Table += "<td><strong>Title (Required)</strong><br />$($_.RequiredCompositionTitle3)</td>`r`n"
$Table += "<td><strong>Composer (Required)</strong><br />$($_.RequiredCompositionComposer3)</td>`r`n"
if(($_.ScanofRequiredpiece3 -split ", ").count -gt 1){
$split = $_.ScanofRequiredpiece3 -split ", "
$i=0
$Table += "<td>"
$split | % {
$i++
$Table += " <a target='_new' href='$($_)'>Scan (Required) $i</a>"
}
$Table += "</td>"
} else {
$Table += "<td><a target='_new' href='$($_.ScanofRequiredpiece3)'>Scan (Required)</a></td>`r`n"
}
$Table += "</tr>`r`n"
$Table += "<tr>`r`n"
$Table += "<td><a target='_new' href='$($_.VideoofRequiredpiece3)'>Video (Required)</a></td>`r`n"
$Table += "<td><strong>Title (Choice)</strong><br />$($_.ChoicePieceTitle3)</td>`r`n"
$Table += "<td><strong>Composer (Choice)</strong><br />$($_.ChoicePieceComposer3)</td>`r`n"
if(($_.ScanofChoicepiece3 -split ", ").count -gt 1){
$split = $_.ScanofChoicepiece3 -split ", "
$i=0
$Table += "<td>"
$split | % {
$i++
$Table += " <a target='_new' href='$($_)'>Scan (Choice) $i</a>"
}
$Table += "</td>"
} else {
$Table += "<td><a target='_new' href='$($_.ScanofChoicepiece3)'>Scan (Choice)</a></td>`r`n"
}
if(($_.VideoofChoicepiece3 -split ", ").count -gt 1){
$split = $_.VideoofChoicepiece3 -split ", "
$i=0
$Table += "<td>"
$split | % {
$i++
$Table += " <a target='_new' href='$($_)'>Video (Choice) $i</a>"
}
$Table += "</td>"
} else {
$Table += "<td><a target='_new' href='$($_.VideoofChoicepiece3)'>Video (Choice)</a></td>`r`n"
}
$Table += "</tr>`r`n"
}

if($_.Class4){
$Filename = "$StudentName-$($_.Class4).html"
$Table += "<tr>`r`n"
$Table += "<td><strong>Event</strong><br />$($_.Class4)</td>`r`n"
$Table += "<td><strong>Timing</strong><br />$($_.TotalAuditionTiming4)</td>`r`n"
$Table += "<td><strong>Title (Required)</strong><br />$($_.RequiredCompositionTitle4)</td>`r`n"
$Table += "<td><strong>Composer (Required)</strong><br />$($_.RequiredCompositionComposer4)</td>`r`n"
if(($_.ScanofRequiredpiece4 -split ", ").count -gt 1){
$split = $_.ScanofRequiredpiece4 -split ", "
$i=0
$Table += "<td>"
$split | % {
$i++
$Table += " <a target='_new' href='$($_)'>Scan (Required) $i</a>"
}
$Table += "</td>"
} else {
$Table += "<td><a target='_new' href='$($_.ScanofRequiredpiece4)'>Scan (Required)</a></td>`r`n"
}
$Table += "</tr>`r`n"
$Table += "<tr>`r`n"
$Table += "<td><a target='_new' href='$($_.VideoofRequiredPiece4)'>Video (Required)</a></td>`r`n"
$Table += "<td><strong>Title (Choice)</strong><br />$($_.ChoicePieceTitle4)</td>`r`n"
$Table += "<td><strong>Composer (Choice)</strong><br />$($_.ChoicePieceComposer4)</td>`r`n"
if(($_.ScanofChoicepiece4 -split ", ").count -gt 1){
$split = $_.ScanofChoicepiece4 -split ", "
$i=0
$Table += "<td>"
$split | % {
$i++
$Table += " <a target='_new' href='$($_)'>Scan (Choice) $i</a>"
}
$Table += "</td>"
} else {
$Table += "<td><a target='_new' href='$($_.ScanofChoicepiece4)'>Scan (Choice)</a></td>`r`n"
}
if(($_.VideoofChoicePiece4 -split ", ").count -gt 1){
$split = $_.VideoofChoicePiece4 -split ", "
$i=0
$Table += "<td>"
$split | % {
$i++
$Table += " <a target='_new' href='$($_)'>Video (Choice) $i</a>"
}
$Table += "</td>"
} else {
$Table += "<td><a target='_new' href='$($_.VideoofChoicePiece4)'>Video (Choice)</a></td>`r`n"
}
$Table += "</tr>`r`n"
}

if($_.Class5){
$Filename = "$StudentName-$($_.Class5).html"
$Table += "<tr>`r`n"
$Table += "<td><strong>Event</strong><br />$($_.Class5)</td>`r`n"
$Table += "<td><strong>Accompanist</strong><br />$($_.AccompanistName5)</td>`r`n"
$Table += "<td><strong>Title (Performance)</strong><br />$($_.Title5)</td>`r`n"
$Table += "<td><strong>Composer (Performance)</strong><br />$($_.Composer5)</td>`r`n"
$Table += "<td><strong>Timing</strong><br />$($_.Timing5)</td>`r`n"
$Table += "</tr>`r`n"
$Table += "<tr>`r`n"
if(($_.Scanofrepertoire5 -split ", ").count -gt 1){
$split = $_.Scanofrepertoire5 -split ", "
$i=0
$Table += "<td>"
$split | % {
$i++
$Table += " <a target='_new' href='$($_)'>Scan (Performance) $i</a>"
}
$Table += "</td>"
} else {
$Table += "<td><a target='_new' href='$($_.Scanofrepertoire5)'>Scan (Performance)</a></td>`r`n"
}
if(($_.StudentPerformancevideo5 -split ", ").count -gt 1){
$split = $_.StudentPerformancevideo5 -split ", "
$i=0
$Table += "<td>"
$split | % {
$i++
$Table += " <a target='_new' href='$($_)'>Video (Performance) $i</a>"
}
$Table += "</td>"
} else {
$Table += "<td><a target='_new' href='$($_.StudentPerformancevideo5)'>Video (Performance)</a></td>`r`n"
}
$Table += "<td></td>`r`n"
$Table += "<td></td>`r`n"
$Table += "<td></td>`r`n"
$Table += "</tr>`r`n"
}

if($_.Class6){
$Filename = "$StudentName-$($_.Class6).html"
$Table += "<tr>`r`n"
$Table += "<td><strong>Event</strong><br />$($_.Class6)</td>`r`n"
$Table += "<td><strong>Timing</strong><br />$($_.Timing6)</td>`r`n"
$Table += "<td><strong>Title (Required)</strong><br />$($_.RequiredPieceTitle6)</td>`r`n"
$Table += "<td><strong>Composer (Required)</strong><br />$($_.RequiredPieceComposer6)</td>`r`n"
if(($_.ScanofRequiredpiece6 -split ", ").count -gt 1){
$split = $_.ScanofRequiredpiece6 -split ", "
$i=0
$Table += "<td>"
$split | % {
$i++
$Table += " <a target='_new' href='$($_)'>Scan (Required) $i</a>"
}
$Table += "</td>"
} else {
$Table += "<td><a target='_new' href='$($_.ScanofRequiredpiece6)'>Scan (Required)</a></td>`r`n"
}
$Table += "</tr>`r`n"
$Table += "<tr>`r`n"
if(($_.StudentPerformancevideo61 -split ", ").count -gt 1){
$split = $_.StudentPerformancevideo61 -split ", "
$i=0
$Table += "<td>"
$split | % {
$i++
$Table += " <a target='_new' href='$($_)'>Video (Performance) $i</a>"
}
$Table += "</td>"
} else {
$Table += "<td><a target='_new' href='$($_.StudentPerformancevideo61)'>Video (Performance)</a></td>`r`n"
}
$Table += "<td><strong>Composer (Choice)</strong><br />$($_.ChoicepieceComposer6)</td>`r`n"
if(($_.ScanofChoicepiece6 -split ", ").count -gt 1){
$split = $_.ScanofChoicepiece6 -split ", "
$i=0
$Table += "<td>"
$split | % {
$i++
$Table += " <a target='_new' href='$($_)'>Scan (Choice) $i</a>"
}
$Table += "</td>"
} else {
$Table += "<td><a target='_new' href='$($_.ScanofChoicepiece6)'>Scan (Choice)</a></td>`r`n"
}
if(($_.Studentperformancevideo62 -split ", ").count -gt 1){
$split = $_.Studentperformancevideo62 -split ", "
$i=0
$Table += "<td>"
$split | % {
$i++
$Table += " <a target='_new' href='$($_)'>Video (Performance) $i</a>"
}
$Table += "</td>"
} else {
$Table += "<td><a target='_new' href='$($_.Studentperformancevideo62)'>Video (Performance)</a></td>`r`n"
}
$Table += "</tr>`r`n"
$Table += "<tr>`r`n"
$Table += "<td><strong>Accompanist</strong><br />$($_.Accompanistname6)</td>`r`n"
$Table += "<td></td>`r`n"
$Table += "<td></td>`r`n"
$Table += "<td></td>`r`n"
$Table += "<td></td>`r`n"
$Table += "</tr>`r`n"
}

if($_.Class7){
$Filename = "$StudentName-$($_.Class7).html"
$Table += "<tr>`r`n"
$Table += "<td><strong>Event</strong><br />$($_.Class7)</td>`r`n"
$Table += "<td><strong>Title (Required)</strong><br />$($_.RequiredpieceTitle7)</td>`r`n"
$Table += "<td><strong>Composer (Required)</strong><br />$($_.RequiredPieceComposer7)</td>`r`n"
if(($_.ScanofRequiredpiece71 -split ", ").count -gt 1){
$split = $_.ScanofRequiredpiece71 -split ", "
$i=0
$Table += "<td>"
$split | % {
$i++
$Table += " <a target='_new' href='$($_)'>Scan (Required) $i</a>"
}
$Table += "</td>"
} else {
$Table += "<td><a target='_new' href='$($_.ScanofRequiredpiece71)'>Scan (Required)</a></td>`r`n"
}
if(($_.VideoofRequiredPiece7 -split ", ").count -gt 1){
$split = $_.VideoofRequiredPiece7 -split ", "
$i=0
$Table += "<td>"
$split | % {
$i++
$Table += " <a target='_new' href='$($_)'>Video (Required) $i</a>"
}
$Table += "</td>"
} else {
$Table += "<td><a target='_new' href='$($_.VideoofRequiredPiece7)'>Video (Required)</a></td>`r`n"
}
$Table += "</tr>`r`n"
$Table += "<tr>`r`n"
$Table += "<td><strong>Title (State)</strong><br />$($_.'3rdStatepieceTitle7')</td>`r`n"
$Table += "<td><strong>Composer (State)</strong><br />$($_.'3rdStatepiececomposer7')</td>`r`n"
if(($_.Scanof3rdStatepiece7 -split ", ").count -gt 1){
$split = $_.Scanof3rdStatepiece7 -split ", "
$i=0
$Table += "<td>"
$split | % {
$i++
$Table += " <a target='_new' href='$($_)'>Scan (State) $i</a>"
}
$Table += "</td>"
} else {
$Table += "<td><a target='_new' href='$($_.Scanof3rdStatepiece7)'>Scan (State)</a></td>`r`n"
}
if(($_.Videoof3rdStatepiece7 -split ", ").count -gt 1){
$split = $_.Videoof3rdStatepiece7 -split ", "
$i=0
$Table += "<td>"
$split | % {
$i++
$Table += " <a target='_new' href='$($_)'>Video (State) $i</a>"
}
$Table += "</td>"
} else {
$Table += "<td><a target='_new' href='$($_.Videoof3rdStatepiece7)'>Video (State)</a></td>`r`n"
}
$Table += "<td></td>`r`n"
$Table += "</tr>`r`n"
}
$Table += "</table>`r`n"

$Html += $Table
$Html += @"
</body>
</html>
"@
if(Test-Path ".\judges\$Filename"){ 
	$append = ((New-Guid).Guid).substring(33,3)
	$Filename = "$($Filename.split(".")[0])$($append).html"
} 

if(Test-Path ".\judges\$Filename"){ "$Filename exists, skipping." }
$Html | Out-File ".\judges\$Filename"

}

}