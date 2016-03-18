#Currency Converter
___

This program will allow the user to add and subtract like currencies, multiply currencies by an number, and convert ammonuts of currency to another type.

###Currency Class
___

The Currency class establishes a currency with an amount and the type of currency it is (the government that guarantees the currency).

The class also allows for currency to be added and subtracted from class object of the same currency type. It allows this by overiding the addition, subtraction, and comparison operators. The multiplication overider has been overidden as well to allow a class object to be mulitplied by a Fixnum or Float.


###Currency Converter Class
___

The Currency Converter class will take Currency object and convert them from one currency type to another (currency type being the government of issue.)

The class will reject any conversion attempt of a currency not in its database.