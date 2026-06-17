## Array Declarations
$myArray = @(1, "test1", "test2")

## getting value from array
$myArray[0]

## Adding value to the Array
$myArray=$myArray + "New Value"

## shortern version
$myArray += "the new value"

## Removing value from array
$myArray = $myArray -ne "test1" # -ne means not equal.

# --> WHN ADDING OR REMOVING VALUE IN ARRAY, THE OLD ARRAY DESTROYED AND A NEW ONE CREATED, WHICH CAUSE TIME CONSUMING WHEN RUNNING THE SCRIPT.


################ ARRAY LIST #################

#############################

## OPTION 1: 

$myList1 = [System.Collections.ArrayList]@()
$myList1.GetType() # will be array list

## OPTION 2:
$myList = New-Object -TypeName System.Collections.ArrayList
$myList.GetType() # will be array list

### Adding element to the array list
[void]$myList.Add('element1') # the void will help to not show the index after element entered

## Adding more that one element at once
$myList.AddRange(@('element2', 'element2', 'element3', 'element'))

## Remove 1 element from the array list
$myList.Remove('element')

## remove element at a specied index
$myList.RemoveAt(0)

## remove more than one element using index
$myList.RemoveRange(0,2) # this will remove element from index 0, 1,and 2

$myList

