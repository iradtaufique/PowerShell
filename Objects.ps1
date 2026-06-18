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