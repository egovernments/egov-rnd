## Dynamic Application Number Generator
Its a simple dynamic application number generation utility which offers the full flexibility for generating application number.

### How does it works
This utility depends on SpEL (Spring Expression Language) and others types of string formatting where SpEL helps to get value
from provided object graph expression. This implementation gives enough flexibility to generate application number as a generic solution
by following some contracts on format. This particular utility uses database to store the application number format data, which mainly 
contains a **name** and a **format** field.
**name** :- a unique name for the application number formatter
**format** :- the format used to construct the actual application number

In this sample project the following is used as **format** (To cover maximum possibility)
```APPNO:{rnd(n,2)}/{rnd(a,2)}/{rnd(an,2)}-[{seq(num_seq, 5)}-{expl(code, 0)}-{expl(relationalEntity.name, 0)}-{expl(1,name)}/{date(ddMMyyyy)}]```

The contract based on the above format is follows (All are optional) :-

1. All externalizable should starts with **{** and ends with **}**.
2. Static text (eg: **APPNO:**) and any special characters (eg: /-) other than **{ or }** can be used as delimiters. 
3. If a random value is required then the expression must be in the following format **rnd(TYPE,LENGTH)**.
   TYPE : **n** for numeric, **a** for alphabets and **an** alphanumeric.
   LENGTH : any whole number to limit the length of random value.
4. If a DB sequence needs to be involved then the expression must be in the following format **seq(PADDING_SIZE,SEQUENCE_NAME)**.
   SEQUENCE_NAME : the name of the DB sequence used to get the next number.
   PADDING_SIZE : any whole number to add 0 padding if sequence value length is less than specified padding.
5. If value should be fetched from the object which is passed as an argument array to the *generateApplicationNumber* API must
   follow format **exp(OBJECT_GRAPH, ARG_INDEX)**.
   OBJECT_GRAPH : SpEL expression object graph eg: in the above format *code* is a field in the passed object.
   ARG_INDEX : array index of the object passed to *generateApplicationNumber* API to use OBJECT_GRAPH to fetch the value.
6. If value should be formatted date then the expression must be in the following format **date(FORMAT)**.
   FORMAT :- any valid java date format.
   
The out put for the above API gives value as follows
``` APPNO:12/FH/P9-[00001-CODE-NAME-NONREL_NAME/23052016]```
   
### How to run the application
1. Clone this repository or download the zip
2. Open the terminal
3. cd to ```dynamicappnumbergenerator``` from the clonned repository or unzipped directory
4. Type ```.\gradlew bootRun```
5. Go to browser and enter http://localhost:8080/

### Enhancement welcome
This is just a kiddish utility code to showcase how to acheive application number generation in a generic and non intrusive way by
leveraging SpEL and basic string manipulations. In this code 50% enhancement scope is left unattended wrt code and logic, if anyone 
intereseted please goahead and enhance.
 
 
