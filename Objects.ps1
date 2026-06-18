## Hash table in powershell is the same as Dictionary in python

$myHashtable = @{
    key1='value1'
    name='valuename'
    numbers=3
    key4='value4'
}

## getting all keys from hashtable
$myHashtable.Keys

## getting all values from hashtable
$myHashtable.Values

## getting single value based on the key
$myHashtable.key1
##or use this 
$myHashtable['key1'] # both will give the same value

#check if hashtable contain certain key or value
$myHashtable.ContainsKey('keyName') # this will check if hashtable contain key keyname
$myHashtable.ContainsValue('value') # this will check if hashtable contains value value

### ADDING AND REMOVING DATA IN HASHTAG

## adding Data in hashtag
$myHashtable.Add('keyname', 'value goes here')
$myHashtable['newKey'] = 'New value'
$myHashtable.newKey = 'New value for new key'

## Editing the value of the current key
$myHashtable.key = 'New Key1 value'

# REmoving element from the key
$myHashtable.Remove('keyname')

#=================== Creating Custom Objects =========================

## Long way to declare Objects
$objectName = New-Object -TypeName PSCustomObject

## aAdding attributes to the object
Add-Member -InputObject $objectName -MemberType NoteProperty -Name 'atribute1' -Value 'value'

## Example

$employee1 = New-Object -TypeName PSCustomObject
Add-Member -InputObject $employee1 -MemberType NoteProperty -Name 'EmployeeID' -Value 001
Add-Member -InputObject $employee1 -MemberType NoteProperty -Name 'FirstName' -Value 'Mary'
Add-Member -InputObject $employee1 -MemberType NoteProperty -Name 'EmployeeTitle' -Value 'CEO'


### ========================= Shorter version Syntaxt============

$newObject = [PSCustomObject]@{
    ObjectName = 'Value'
}


# This is an example
$employee2 = [PSCustomObject]@{
    EmployeeID = 002
    Firstname = 'Peter'
    EmployeeTitle = 'Developer'
}

$employee2.EmployeeTitle
